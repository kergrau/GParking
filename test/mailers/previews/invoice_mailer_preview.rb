# Preview all emails at http://localhost:3000/rails/mailers/invoice_mailer
class InvoiceMailerPreview < ActionMailer::Preview
  def welcome_email
    #@user = correo
    InvoiceMailer.welcome_email("kergrau@hotmail.com")
  end
end
