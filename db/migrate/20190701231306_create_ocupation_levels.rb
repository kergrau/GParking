class CreateOcupationLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :ocupation_levels do |t|
      t.integer :parking_id
      t.decimal :ol_percent_pay, scale: 2, precision: 3
      t.string :ol_level, limit: 2
      t.decimal :ol_min, scale: 2, precision: 3
      t.decimal :ol_max, scale: 2, precision: 3
      t.string :ol_type_car, limit: 10

      t.timestamps
    end
  end
end
