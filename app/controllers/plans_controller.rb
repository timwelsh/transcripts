class PlansController < ApplicationController
	before_filter :authenticate_user!
	load_and_authorize_resource 
	def new
	end
	def index
		@plan = Plan.all
	end
end
