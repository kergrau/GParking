class InvoiceMailer < ApplicationMailer

  self.smtp_settings = {
    address:              'SMTP.Office365.com',
    port:                 587,
    domain:               'example.com',
    user_name:            'synapkg@outlook.com',
    password:             '20/10/2018.A',
    authentication:       'login',
    enable_starttls_auto: true  }

  default from: 'synapkg@outlook.com'

  def welcome_email(correo, items)
    @items = items
    #@correo = 
    #@url  = 'http://example.com/login'
    mail(to: "kergrau@hotmail.com", subject: 'Your Invoice')
  end
end
