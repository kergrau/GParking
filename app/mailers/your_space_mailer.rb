class YourSpaceMailer < ApplicationMailer

  self.smtp_settings = {
    address:              'SMTP.Office365.com',
    port:                 587,
    domain:               'example.com',
    user_name:            'synapkg@outlook.com',
    password:             '20-10-2018.A',
    authentication:       'login',
    enable_starttls_auto: true  }

  default from: 'synapkg@outlook.com'

  def your_parking(correo, numspace, floorspace)
    @numspace = numspace
    @floorspace = floorspace
    mail(to: correo, subject: 'Your car parking')
  end

end
