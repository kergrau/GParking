class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.string :railcars_id, :limit => 10
      t.datetime :horafinal
      t.boolean :estado

      t.timestamps
    end
  end
end
