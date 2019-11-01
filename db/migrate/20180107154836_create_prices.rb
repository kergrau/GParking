class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.decimal :valor, :limit => 4
      t.string :tipo_carro, :limit => 10
      t.time :hora_inicio
      t.time :hora_fin
      t.boolean :estado
      t.integer :parking_id

      t.timestamps
    end
  end
end
