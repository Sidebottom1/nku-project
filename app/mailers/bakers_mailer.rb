class BakersMailer < ActionMailer::Base
  default from: ENV.fetch('GMAIL_USERNAME')
  
  def request_email(bakers, request)
    @request = request
    mail(to: bakers.email_addresses, subject: 'Hey, listen!')
  end
end