# With thiss class y managment spaces.
class Space < ApplicationRecord
  belongs_to :parking

  def ocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: true)
  end

  def notificar_ocupacion(correo, id)
    spaces = numero_espacio(id)
    # YourSpaceMailer.your_parking(correo, spaces.sp_number,
    #                             spaces.sp_floor).deliver_later
  end

  def desocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: false)
  end

  def asignar_espacio(id, parking)
    space_id = Space.connection.select_all("
      SELECT spaces.id
      FROM spaces
      WHERE spaces.sp_state = false AND spaces.parking_id = #{parking} AND
       spaces.sp_type = (
        SELECT railcars.tipo
        FROM railcars
        WHERE railcars.id = #{id}
      ) LIMIT 1").to_hash
    space_id.blank? ? nil : space_id[0]['id']
  end

  # Esto debe ser par las graficas
  def espacios_disponibles_carros
    Space.where(sp_state: false, sp_type: 'CARRO').count
  end

  # Esto debe ser par las graficas
  def espacios_disponibles_motos
    Space.where(sp_state: false, sp_type: 'MOTO').count
  end

  def espacios_ocupados_carros
    Space.where(sp_state: true, sp_type: 'CARRO').count
  end

  def espacios_ocupados_motos
    Space.where(sp_state: true, sp_type: 'MOTO').count
  end

  def espacios_total_motos
    Space.where(sp_type: 'MOTO').count
  end

  def espacios_total_carros
    Space.where(sp_type: 'CARRO').count
  end

  def porcentaje_carros
    p (espacios_ocupados_carros.to_f / espacios_total_carros.to_f) * 100
  end

  def porcentaje_motos
    (espacios_ocupados_motos.to_f / espacios_total_motos.to_f) * 100
  end

  def nivel_ocupacion
    porcentaje = porcentaje_carros
    p nivel = Level.select(:id).where(
      "levels.lev_min <= #{porcentaje}", "levels.lev_max >= #{porcentaje}",
      lev_state: true
    )

    nivel.blank? ? 0 : nivel[0]['id']
  end

  def numero_espacio(id)
    p Space.find(id)
  end
end
