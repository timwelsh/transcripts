class HomesController < ApplicationController
	
	def index
	end


	def dashboard
		if !current_user.blank?
			if !current_user.subscription.blank?
				if !current_user.subscription.plan_id.blank?
					subs_plan_id=current_user.subscription.plan_id
					@subs_plan_name=Plan.find(subs_plan_id).name
				else
					@subs_plan_name='Trial'
				end
			end
		else
			redirect_to root_path
		end
	end
end
