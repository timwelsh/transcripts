class HomesController < ApplicationController
	
	def index
	end


	def dashboard
		if !current_user.subscription.blank?
			subs_plan_id=current_user.subscription.plan_id
			@subs_plan_name=Plan.find(subs_plan_id).name
		else
			@subs_plan_name="Trial"
		end
	end
end
