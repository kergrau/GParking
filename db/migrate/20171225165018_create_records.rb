class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :railcars_id, :limit => 10
      t.datetime :horainicio
      t.datetime :horafinal
      t.boolean :estado
      t.string :rec_type, :limit => 1
      t.string :rec_type, :limit => 7

      t.timestamps
    end
  end
end
