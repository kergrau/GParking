class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :railcar_id, :limit => 8
      t.integer :space_id, limit: 8
      t.datetime :horainicio
      t.datetime :horafinal
      t.boolean :estado
      t.string :rec_type, :limit => 1

      t.timestamps
    end
  end
end
