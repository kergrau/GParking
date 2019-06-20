class Space < ApplicationRecord

  def ocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: true)
  end

  def notificar_ocupacion(correo, id)
    spaces = numero_espacio(id)
    YourSpaceMailer.your_parking(correo, spaces.sp_number,
    spaces.sp_floor).deliver_later
  end

  def desocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: false)
  end

  def asignar_espacio(id)
    space_id = Space.connection.select_all("
      SELECT spaces.id
      FROM spaces
      WHERE spaces.sp_state = false and spaces.sp_type = (
        SELECT railcars.tipo
        FROM railcars
        WHERE railcars.id = #{id}
      ) LIMIT 1").to_hash
    if space_id.blank? then nil else space_id[0]['id'] end
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

  def numero_espacio(id)
    p Space.find(id)
  end
end
