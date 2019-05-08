class AddResevationsInvoices < ActiveRecord::Migration[5.1]
  def change
    add_column :invoices, :in_reservation, :string, :limit => 1
  end
end
