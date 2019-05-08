class ChangeColumns < ActiveRecord::Migration[5.1]
  def change
    change_column :records, :horainicio, :time, :limit => 5
    change_column :records, :horafinal, :time, :limit => 5
  end
end
