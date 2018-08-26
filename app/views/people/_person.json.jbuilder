json.extract! person, :id, :nombre1, :nombre2, :apellido1, :apellido2, :dni, :correo, :telefono, :direccion, :created_at, :updated_at
json.url person_url(person, format: :json)
