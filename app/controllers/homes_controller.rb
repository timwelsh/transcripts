class HomesController < ApplicationController
	
	def index
	end


	def dashboard
		subs_plan_id=current_user.subscription.plan_id
		@subs_plan_name=Plan.find(subs_plan_id).name
	end
end
