class AddHoraInicioToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :horainicio, :string, :limit => 5
  end
end
