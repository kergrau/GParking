class CreateInvoiceDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :invoice_details do |t|
      t.integer :invoice_id, limit: 8
      t.string :ind_inicio
      t.string :ind_fin
      t.float :ind_minutos
      t.float :ind_valor

      t.timestamps
    end
  end
end
