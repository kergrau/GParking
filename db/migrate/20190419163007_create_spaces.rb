class CreateSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :spaces do |t|
      t.integer :sp_floor, :limit => 2
      t.integer :sp_number, :limit => 3
      t.boolean :sp_state

      t.timestamps
    end
  end
end
