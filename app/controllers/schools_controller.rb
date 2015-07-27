class SchoolsController < ApplicationController
	load_and_authorize_resource 
	def index
		@school = current_user.school
	end 

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)
		@school.user_id = current_user.id
		@school.save
		redirect_to schools_path
	end

	def show
		@school =School.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do
    			 @pdf = render_to_string pdf: "school" ,:template => 'schools/show.html.erb',
    			# print_media_type: true ,
    			layout:'pdf.html'
    			send_data(@pdf, :filename => @school.school_name,  :type=>"application/pdf")
    		end
		end
		#@student = @school.students
	end

	def edit
		@school = School.find(params[:id])
	end

	def destroy
		@school = School.find(params[:id])
		@school.destroy
		redirect_to schools_path
	end 

	def update
		@school = School.find(params[:id])
		if @school.update(school_params)
			redirect_to @school
		else
			render 'edit'
		end
	end

	def user_detail_copy
		@user = User.find(current_user)
		render json:@user
	end

	def school_detail_copy
		@school = School.find_by_user_id(current_user)
		render json:@school
	end

	def subregion_options
		render partial: 'subregion_select'
	end

	private
	def school_params
		params.require(:school).permit(:school_name , :admin_name, :address1,:address2 , :address3 , :country , :state , :city, :zip , :phone,:email, :academic_term, :grading_scale )
	end

end
