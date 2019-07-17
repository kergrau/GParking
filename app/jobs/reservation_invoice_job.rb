class ReservationInvoiceJob < ApplicationJob
  queue_as :default

  def perform(id)
    invoice = Invoice.new
    invoice.crear_factura(id)
  end
end
