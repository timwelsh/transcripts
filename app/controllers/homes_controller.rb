class HomesController < ApplicationController
	
	def index
	end


	def dashboard
		@expire=false
		if !current_user.blank?
			if !current_user.subscription.blank?
				if !current_user.subscription.plan_id.blank?
					subs_plan_id=current_user.subscription.plan_id
					@subs_plan_name=Plan.find(subs_plan_id).name
				else
					@subs_plan_name='Trial'
				end
				if current_user.subscription.plan_end_date<=Date.today
					flash['alert'] = "Your Plan subscription has been expired."
					@expire=true
				end
			end
		else
			redirect_to root_path
		end
	end
end
