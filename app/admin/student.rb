ActiveAdmin.register Student do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #

  permit_params :user_id, :school_name, :admin_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :email,:academic_term,:grading_scale
  
  index do
    selectable_column
    column :student_name do |resource|
     resource.first_name+' '+resource.last_name
    end
    column :dob
    column :phone
    column :email
    column :enroll_date
    column :graduation_date
    actions
  end

  filter :first_name
  filter :last_name
  filter :email
  filter :created_at


controller do
  layout 'active_admin' , :except => [:index]
  def scoped_collection
    if params[:user_id]
      sql = "user_id =  '#{params[:user_id]}'"
      super.where(sql)
    else
      super
    end
  end

  def create
    @student = Student.new student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: academic_params["total_credit"],gpa_credit: academic_params["gpa_credit"],gpa_points: academic_params["gpa_points"],cumulative_gpa: academic_params["cumulative_gpa"])
    if @student.save
      redirect_to  admin_students_path 
    else
      render 'new'
    end 
  end 

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: academic_params["total_credit"],gpa_credit: academic_params["gpa_credit"],gpa_points: academic_params["gpa_points"],cumulative_gpa: academic_params["cumulative_gpa"])
      redirect_to  admin_students_path
    else
      render 'edit'
    end
  end
  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to admin_students_path 
  end

  private
  def student_params
    params.require(:student).permit(:school_id ,:first_name , :middle_name , :last_name, :dob, :address1 , :address2 ,:address3 , :country, :state , :city , :zip, :phone ,:email, :enroll_date ,:graduation_date)
  end

  def academic_params
    params.permit(:grad_name => [] ,:completion_year => [], :description =>[] , :subject => [] , :course_name => [] , :honors => [] , :grade => [] , :credits => [] , :total_credit => [] , :gpa_credit => [] , :gpa_points => [] , :cumulative_gpa => [])
  end
end

end
