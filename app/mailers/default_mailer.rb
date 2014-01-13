class DefaultMailer < ActionMailer::Base
  include SendGrid
  default to: ''
  
  def contact(contact)
    @contact = contact
    sendgrid_category "Contato   "
    mail subject: 'Contato do Site',
      from: @contact.email
  end
end
