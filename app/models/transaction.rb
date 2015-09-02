class Transaction < ActiveRecord::Base
 belongs_to :subscription
 after_create :thanks_email_to_user
 def thanks_email_to_user
    @user = self.subscription.user.first_name
    @email= self.subscription.user.email
    UserMailer.success_payment(@email,@user).deliver
  end
 end

