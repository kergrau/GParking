class CreateRailcars < ActiveRecord::Migration[5.1]
  def change
    create_table :railcars do |t|
      t.integer :person_id, :limit => 8
      t.string :placa, :limit => 7
      t.string :marca, :limit => 20
      t.string :modelo, :limit => 20
      t.string :tipo, :limit => 10

      t.timestamps
    end
  end
end
