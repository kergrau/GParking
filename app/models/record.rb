class Record < ApplicationRecord
  belongs_to :railcar
  validates :space_id, presence: { message: 'No hay espacio en este momento' },
            on: :create
  validates :railcar_id, presence: { message: "Numero de placa inexistente
  o en blanco" }, on: :create
  before_update :facturacion, unless: :reservation_cancel?
  before_update :desasignar_espacio
  after_validation :tipo_reserva, on: :create
  before_validation :placa_a_id, on: :create
  before_validation :asignar_espacio, on: :create, unless: :tipo_inicio
  before_validation :crear_reserva, on: :create, if: :tipo_inicio
  after_validation :hora_inicio, on: :create, unless: :tipo_inicio
  after_validation :hora_fin, on: :update, unless: :tipo_fin
  # after_validation :mayus_minus, :on => [:create, :update]
  after_create :crear_factura, on: :create
  after_create :notificar_espacio, on: :create
  after_create :crear_recordatorio_salida, on: :create, if: :tipo_fin

  def placa_a_id
    p railcar = Railcar.select(:id).where(placa: railcar_id)

    if railcar.present?
      # self.railcar_id = ''
      p its_inside = Record.select(:id).where(railcar_id: railcar[0]['id'],
                                              estado: true)
      if its_inside.blank?
        self.railcar_id = railcar[0]['id']
        return self.railcar_id
      end
    end
    self.railcar_id = nil
  end

  def buscar_correo
    correo = Person.connection.select_all(
      "SELECT people.correo FROM people WHERE people.id = (
         SELECT railcars.person_id FROM railcars WHERE railcars.id = (
           SELECT records.railcar_id FROM records
             WHERE records.id = #{self.id}
          )
        )
      "
    ).to_hash
    correo[0]['correo']
  end

  def facturacion
    unless self.estado
      # desasignar_espacio
      contatiempo = self.horainicio
      hora_fin unless tipo_fin
      totalti = (self.horafinal - contatiempo)
      # Recuerda que el numero de factura debe ser autoincremental y no
      # aleatorio.
      in_detail = InvoiceDetail.new
      invoice = Invoice.new
      sum_precio = 0
      sum_precio = in_detail.iterador_horario(totalti, contatiempo, sum_precio,
                                 items = [], in_detail.consulta(self.id),
                                 self.horafinal)

      in_detail.detalle_factura(invoice.buscar_factura(self.id), items)
     # InvoiceMailer.welcome_email(buscar_correo, items,
     #                             sum_precio, tax_level(level_id),
     #                             reservation_tax(rec_type)).deliver_later
    end
  end

  def reservation_cancel?
    Time.now < horainicio ? true : false
  end

  def tax_level(level)
    tax = Level.select(:lev_percent_pay).where(id: level)
    tax.blank? ? 0 : tax[0]['lev_percent_pay'].to_f / 100
  end

  def reservation_tax(reservation)
    reservation.to_i.between?(1, 2) ? 0.05 : 0
  end

  def crear_factura
    unless tipo_inicio
      invoice = Invoice.new
      invoice.crear_factura(self.id)
    else
      ReservationInvoiceJob.set(wait: (self.horainicio - Time.now).seconds).perform_later(self.id)
    end
  end

  def tiempo_salida
    salida = self.horafinal - Time.now
    return ((salida - 1800) / 60).to_i
  end

  def crear_recordatorio_salida
    placa = Railcar.select(:placa).where(id: railcar_id)
    espacio = Space.select(:sp_number, :sp_floor).where(id: space_id)

    #YourSpaceMailer.exit_reminder_mail(self.horafinal.to_s, buscar_correo,
    #                                   placa[0].placa, espacio[0].sp_number,
    #                                   espacio[0].sp_floor).deliver_later(
    #                                     wait_until: tiempo_salida.minutes.from_now)

  end

  def horas
    Time.now
  end

  def tipo_inicio
    if self.horainicio.blank? then false else true end
  end

  def tipo_fin
    if self.horafinal.blank? then false else true end
  end

  def hora_inicio
    self.horainicio = horas
  end

  def hora_fin
    self.horafinal = horas
  end

  def tipo_reserva
    if tipo_inicio && tipo_fin
      self.rec_type = "1" # "reserva completa"
    elsif tipo_inicio && !tipo_fin
      self.rec_type = "2" # "apartar cupo"
    elsif !tipo_inicio && tipo_fin
      self.rec_type = "3" # "asegura salida"
    else
      self.rec_type = "4" # "demanda completa"
    end
  end

  def asignar_espacio
    space = Space.new
    if self.railcar_id.present?
      self.level_id = space.nivel_ocupacion
      self.space_id = space.asignar_espacio(self.railcar_id)
      # ReservationsJob.set(wait: (self.horainicio - Time.now).seconds
      # ).perform_later(self.space_id) if tipo_inicio
      space.ocupar_espacio(self.space_id) unless self.space_id.blank?
    end
  end

  def notificar_espacio
    space = Space.new
    space.notificar_ocupacion(buscar_correo, self.space_id)
  end

  def desasignar_espacio
    unless estado
      space = Space.new
      space.desocupar_espacio(self.space_id)
    end
  end

  # Reserva maximo con 4 horas de anticipacion.
  def crear_reserva
    if (horainicio - Time.now) < 14_400
      ReservationsJob.set(wait: (self.horainicio - Time.now).seconds).perform_later(self.space_id)
      asignar_espacio
    end
  end

  private

  def mayus_minus
    self.railcar_id = railcar_id.upcase # Envia la placa en mayusculas.
    end
end
