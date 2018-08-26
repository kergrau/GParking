class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :nombre1, :limit => 20
      t.string :nombre2, :limit => 20
      t.string :apellido1, :limit => 20
      t.string :apellido2, :limit => 20
      t.string :dni, :limit => 10
      t.string :correo, :limit => 60
      t.string :telefono, :limit => 10
      t.string :direccion, :limit => 200

      t.timestamps
    end
  end
end
