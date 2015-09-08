class PlansController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource 
	def new
	end
	def index
		subs_plan_id=current_user.subscription.plan_id
		@subs_plan_name=Plan.find(subs_plan_id).name
		@plan = Plan.all
	end
end
