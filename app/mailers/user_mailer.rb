class UserMailer < ActionMailer::Base
  default from: "\"Transcript\" <admin@transcript.me>"

  def success_email(email,user)
    @email = email
    @user = user
    mail(to: @email, subject: 'Welcome to Transcript.me')
  end

  def success_payment(email,user,plan,amount,endate)
    @email = email
    @user = user
    @plan=plan
    @amount=amount
    @endate=endate
    mail(to: @email, subject: 'Thanks for Payment')
  end

  default to: "Inveera <inveera.test1@gmail.com>"

  def new_message(message)
    @message = message
    
    mail subject: "Message from #{message.name}"
  end 

end