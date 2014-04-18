# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
NkuProject::Application.initialize!

ActionMailer::Base.smtp_settings = {
  :address          =>   'smtp.gmail.com',
  :port             =>   587,
  :authentication   =>   :plain,
  :user_name        =>   ENV.fetch('GMAIL_USERNAME'),
  :password         =>   ENV.fetch('GMAIL_PASSWORD'),
  :domain           =>   'gmail.com',
  :enable_starttls_auto  =>  true
}
