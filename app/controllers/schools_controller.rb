class SchoolsController < ApplicationController

	def index
		@school = School.all
	end 

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		@school.user_id = current_user.id
		@school.save
	end

	def show
		@school =School.find(params[:id])
	end

	def subregion_options
		render partial: 'subregion_select'
	end

	private
	def school_params
		params.require(:school).permit(:school_name , :admin_name, :address1,:address2 , :address3 , :country , :state , :city, :zip , :phone,:email, :academic_term, :grading_scale )
	end

end
