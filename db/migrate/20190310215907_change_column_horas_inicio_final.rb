class ChangeColumnHorasInicioFinal < ActiveRecord::Migration[5.1]
  def change
    change_column :records, :horainicio, :datetime
    change_column :records, :horafinal, :datetime
  end
end
