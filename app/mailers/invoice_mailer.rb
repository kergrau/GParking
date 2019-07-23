class InvoiceMailer < ApplicationMailer

  self.smtp_settings = {
    address: 'SMTP.Office365.com',
    port: 587,
    domain: 'example.com',
    user_name: 'synapkg@outlook.com',
    password: '20.10.2018.A;',
    authentication: 'login',
    enable_starttls_auto: true
  }

  default from: 'synapkg@outlook.com'

  def welcome_email(correo, items, sum_precio, level, tipo_reserva)
    @items = items
    @sum_precio = sum_precio
    @level_ocupation_tax = @sum_precio * level
    @reservation_tax = @sum_precio * tipo_reserva
    mail(to: correo, subject: 'Your Invoice')
  end
end
