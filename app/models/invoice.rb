class Invoice < ApplicationRecord
  def buscar_factura(id)
    id = Invoice.select(:id).where(records_id: id)
    id[0]["id"]
  end

  def crear_factura(record_id)
    Invoice.create(records_id: record_id, in_number: "#{rand(1_000_000)}",
    in_date: Time.now, in_time: Time.now)
  end
end
