class PlansController < ApplicationController
	def new
	end
	
	def index

	@plan = Plan.all
	
	end
end
