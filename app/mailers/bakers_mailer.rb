class BakersMailer < ActionMailer::Base
  default from: 'sidebottom1@nku.edu'
  
  def test_email
    mail(to: 'sidebottom1@nku.edu', subject: 'Welcome to My Awesome Site', body: 'this worked')
  end
end