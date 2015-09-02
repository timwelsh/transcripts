class UserMailer < ActionMailer::Base
  default from: "\"Transcript\" <admin@transcript.me>"

  def success_email(email,user)
    @email = email
    @user = user
    mail(to: @email, subject: 'Welcome to Transcript.me')
  end

  def success_payment(email,user)
    @email = email
    @user = user
    mail(to: @email, subject: 'Thanks for Payment')
  end
end