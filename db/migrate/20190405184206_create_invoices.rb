class CreateInvoices < ActiveRecord::Migration[5.1]
  def change
    create_table :invoices do |t|
      t.integer :record_id, :limit => 20
      t.string :in_number, :limit => 6
      t.date :in_date
      t.time :in_time

      t.timestamps
    end
  end
end
