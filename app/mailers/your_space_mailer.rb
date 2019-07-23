class YourSpaceMailer < ApplicationMailer

  self.smtp_settings = {
    address:              'SMTP.Office365.com',
    port:                 587,
    domain:               'example.com',
    user_name:            'synapkg@outlook.com',
    password:             '20.10.2018.A;',
    authentication:       'login',
    enable_starttls_auto: true  }

  default from: 'synapkg@outlook.com'

  # Send a mail with the position of railcar in the parking
  def your_parking(correo, numspace, floorspace)
    @numspace = numspace
    @floorspace = floorspace
    mail(to: correo, subject: 'Your car parking')
  end

  # Send a mail with a reminder to exit a railcar
  def exit_reminder_mail(horafinal, correo, placa, numspace, floorspace)
    @numspace = numspace
    @floorspace = floorspace
    @horafinal = ((Time.parse(horafinal) - Time.now) / 60).to_i
    @placa = placa
    mail(to: correo, subject: 'Your car reminder')
  end

end
