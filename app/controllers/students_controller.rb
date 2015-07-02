class StudentsController < ApplicationController
	def create 
		@school = School.find(params[:school_id])
		@student = @school.students.create(student_params)
		@academic = Academic.new(academic_params)
		@academic.student_id = @student.id
		@academic.save
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
		params.permit(:grad_names => [] ,:completion_years => [], :descriptions =>[] , :subject => [] , :course_name => [] , :honors => [] , :grade => [] , :credits => [] , :total_credit => [] , :gpa_credit => [] , :gpa_points => [] , :cumulative_gpa => [])
	end
end
