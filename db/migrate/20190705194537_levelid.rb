class Levelid < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :level_id, :integer
  end
end
