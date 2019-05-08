class RemoveInReservationInvoces < ActiveRecord::Migration[5.1]
  def change
    remove_column :invoices, :in_reservation, :string
    add_column :records, :rec_type, :string, :limit => 1
  end
end
