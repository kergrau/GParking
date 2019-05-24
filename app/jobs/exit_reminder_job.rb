class ExitReminderJob < ApplicationJob
  queue_as :default

  def perform(horafinal, correo, placa, numspace, floorspace)
    YourSpaceMailer.exit_reminder_mail(horafinal, correo, placa,
    numspace, floorspace).deliver_now
  end
end
