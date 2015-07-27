class StudentsController < ApplicationController
	load_and_authorize_resource 
	def index
		@school = School.find(params[:school_id])
		@student = @school.students
	end

	def new 
		@school = School.find(params[:school_id])
		@student = @school.students.new
	end

	def create 
		@school = School.find(params[:school_id])
		@student = @school.students.new student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: academic_params["total_credit"],gpa_credit: academic_params["gpa_credit"],gpa_points: academic_params["gpa_points"],cumulative_gpa: academic_params["cumulative_gpa"])
		@student.save	
		redirect_to  school_students_path 
	end

    def show
		@school = School.find(params[:school_id])
		@student = @school.students.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do
    			 @pdf = render_to_string pdf: "student" ,:template => 'students/show.html.erb',
    			# print_media_type: true ,
    			layout:'pdf.html'
    			send_data(@pdf, :filename => @student.first_name,  :type=>"application/pdf")
    		end
		end
	end

	def edit
		@school = School.find(params[:school_id])
		@student = @school.students.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
		if @student.update student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: academic_params["total_credit"],gpa_credit: academic_params["gpa_credit"],gpa_points: academic_params["gpa_points"],cumulative_gpa: academic_params["cumulative_gpa"])
			redirect_to  school_students_path 
		else
			render 'edit'
		end
	end

	def destroy
		@school = School.find(params[:school_id])
		@student = @school.students.find(params[:id])
		@student.destroy
		redirect_to school_students_path 
	end


	def subregion_options
		render partial: 'subregion_select'
	end
	
	private
	def student_params
		params.require(:student).permit(:first_name , :middle_name , :last_name, :dob, :address1 , :address2 ,:address3 , :country, :state , :city , :zip, :phone ,:email, :enroll_date ,:graduation_date)
	end

	def academic_params
		params.permit(:grad_name => [] ,:completion_year => [], :description =>[] , :subject => [] , :course_name => [] , :honors => [] , :grade => [] , :credits => [] , :total_credit => [] , :gpa_credit => [] , :gpa_points => [] , :cumulative_gpa => [])
	end
end
