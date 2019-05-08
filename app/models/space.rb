class Space < ApplicationRecord
  
  def ocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: true)
  end

  def desocupar_espacio(id)
    space = Space.find_by(id: id)
    space.update(sp_state: false)
  end
  
  def asignar_espacio(id)
    spaces_id = Space.connection.select_all("
      SELECT spaces.id 
      FROM spaces 
      WHERE spaces.sp_state = false and spaces.sp_type = (
        SELECT railcars.tipo 
        FROM railcars 
        WHERE railcars.id = #{id}
      ) LIMIT 1").to_hash
    spaces_id[0]['id']
  end
end
