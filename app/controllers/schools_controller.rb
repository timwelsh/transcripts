class SchoolsController < ApplicationController
	before_filter :authenticate_user!,except:[:subregion_options]
	load_and_authorize_resource except: [:user_detail_copy,:school_detail_copy , :subregion_options]
	def index
		@school = current_user.school
	end 
	def new
		@school = School.new
	end
    def checkemail
        if School.where('email = ?', params[:email]).count == 0
            render json: {:email=>'not exist'}
        else
            render json: {:email=>'exist'}
        end
    end
	def create
		if !current_user.school
			@school = School.new(school_params)
			@school.user_id = current_user.id
			if @school.save
			 redirect_to new_school_student_path(@school.id)
            else
               redirect_to schools_path
            end 
		else
			flash[:notice]= "User has already School"
			redirect_to schools_path
		end
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
    		redirect_to schools_path
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
