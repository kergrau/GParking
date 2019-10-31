class CreateLevels < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.integer :parking_id
      t.decimal :lev_percent_pay, scale: 2, precision: 3
      t.string :lev_level, limit: 2
      t.decimal :lev_min, scale: 2, precision: 3
      t.decimal :lev_max, scale: 2, precision: 3
      t.string :lev_type_car, limit: 10
      t.boolean :lev_state

      t.timestamps
    end
  end
end