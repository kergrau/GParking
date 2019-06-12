class Record < ApplicationRecord
  validates :spaces_id, presence: {message: "No hay espacio en este momento"}, on: :create
  validates :railcars_id, presence: {message: "Numero de placa inexistente
  o en blanco"}, on: :create
  #before_update :facturacion
  after_validation :tipo_reserva, on: :create
  before_validation :placa_a_id, on: :create
  before_validation :asignar_espacio, on: :create
  after_validation :hora_inicio, on: :create, unless: :tipo_inicio
  after_validation :hora_fin, on: :update, unless: :tipo_fin
  after_validation :mayus_minus, :on => [:create, :update]
  #after_create :crear_factura, :on => :create
  #after_create :notificar_espacio, :on => :create
  #after_create :crear_recordatorio_salida, on: :create, if: :tipo_fin

  def placa_a_id
    railcars_id = Railcar.select([Railcar.arel_table[:id],
    Railcar.arel_table[:tipo]]).
    where(Railcar.arel_table[:placa].eq(self.railcars_id))

    if railcars_id.blank?
      self.railcars_id = ''
    else
      self.railcars_id = railcars_id[0]['id']
    end
  end

  def buscar_correo
    correo = Person.connection.select_all(
      "SELECT people.correo FROM people WHERE people.id = (
         SELECT railcars.people_id FROM railcars WHERE railcars.id = (
           SELECT records.railcars_id FROM records
             WHERE records.id = #{self.id}
          )
        )
      "
    ).to_hash
    correo[0]['correo']
  end

  def facturacion
    unless self.estado
      desasignar_espacio
      contatiempo = self.horainicio
      hora_fin unless tipo_fin
      totalti = (self.horafinal - contatiempo)
      # Recuerda que el numero de factura debe ser autoincremental y no
      # aleatorio.
      inDetail = InvoiceDetail.new
      invoice = Invoice.new
      inDetail.iterador_horario(totalti, contatiempo, sum_precio = 0,
       items = [], inDetail.consulta(self.id), self.horafinal)
      inDetail.detalle_factura(invoice.buscar_factura(self.id), items)
      #p colector = items.join(", ")
      InvoiceMailer.welcome_email(buscar_correo, items).deliver_later
    end # Condicional
  end # Metodo

  def crear_factura
    invoice = Invoice.new
    invoice.crear_factura(self.id)
  end

  def tiempo_salida
    salida = self.horafinal - Time.now
    return ((salida - 1800) / 60).to_i
  end

  def crear_recordatorio_salida
    placa = Railcar.select(:placa).where(id: railcars_id)
    espacio = Space.select(:sp_number, :sp_floor).where(id: spaces_id)
    
    YourSpaceMailer.exit_reminder_mail(self.horafinal.to_s, buscar_correo,
    placa[0].placa, espacio[0].sp_number, espacio[0].sp_floor).deliver_later(
    wait_until: tiempo_salida.minutes.from_now)
  end

  def horas # Con este me definira las horas de inicio y final.
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
    self.spaces_id = space.asignar_espacio(self.railcars_id)
    space.ocupar_espacio(self.spaces_id) unless self.spaces_id.blank?
  end

  def notificar_espacio
    space = Space.new
    space.notificar_ocupacion(buscar_correo, self.spaces_id)
  end

  def desasignar_espacio
    space = Space.new
    space.desocupar_espacio(self.spaces_id)
  end

  private

    def mayus_minus
      self.railcars_id = railcars_id.upcase #Envia la placa en mayusculas.
    end
end
