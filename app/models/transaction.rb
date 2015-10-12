class Transaction < ActiveRecord::Base
	belongs_to :subscription
	after_create :thanks_email_to_user
	def thanks_email_to_user
		@user = self.subscription.user.first_name
		@email= self.subscription.user.email
		plan1 = Plan.find(self.subscription.plan_id)
		@plan = plan1.name
		@amount=plan1.amount.to_i/100
		@endate=self.subscription.plan_end_date
		
		UserMailer.success_payment(@email,@user,@plan,@amount,@endate).deliver
	end
end

