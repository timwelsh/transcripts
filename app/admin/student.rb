ActiveAdmin.register Student do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  member_action :view_pdf, :method=>:get do
  end

  permit_params :user_id, :school_name, :admin_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :email,:academic_term,:grading_scale

  # actions :all, :except => [:destroy]
  # content only: :show do
  #   render 'index'
  # end
  
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
    actions :defaults => true do |resource|
      link_to "View PDF", {:action => 'view_pdf', :id => resource }, :method => :get
    end
    
  end

  filter :first_name
  filter :email
  filter :phone


controller do
   layout 'active_admin' , :except => [:index, :destroy,:view_pdf]
     def scoped_collection
      if params[:school_id]
        sql = "school_id =  '#{params[:school_id]}'"
        super.where(sql)
      else
        super
      end
    end

  def create

    grade=[]
    credit=[]
    gpa_points=[]
    gpa_credit=[]
    total_credits=[]
     cumulative_gpa=[]
    a=0
    academic_params[:grade].each_index.map do |val|
      case academic_params[:grade][val]
        when 'A+'    #compare to 1
          grade[val] = 4.3
          credit[val] = academic_params[:credits][val].to_f
        when 'A'    #compare to 2
          grade[val] = 4
          credit[val] = academic_params[:credits][val].to_f
        when 'A-'    #compare to 2
          grade[val] = 3.7
          credit[val] = academic_params[:credits][val].to_f
        when 'B+'    #compare to 1
          grade[val] = 3.3
          credit[val] = academic_params[:credits][val].to_f
        when 'B'    #compare to 2
          grade[val] = 3
          credit[val] = academic_params[:credits][val].to_f
        when 'B-'    #compare to 2
          grade[val] = 2.7
          credit[val] = academic_params[:credits][val].to_f
        when 'C+'    #compare to 1
          grade[val] = 2.3
          credit[val] = academic_params[:credits][val].to_f
        when 'C'    #compare to 2
          grade[val] = 2
          credit[val] = academic_params[:credits][val].to_f
        when 'C-'    #compare to 2
          grade[val] = 1.7
          credit[val] = academic_params[:credits][val].to_f
        when 'D+'    #compare to 1
          grade[val] = 1.3
          credit[val] = academic_params[:credits][val].to_f
        when 'D'    #compare to 2
          grade[val] = 1
          credit[val] = academic_params[:credits][val].to_f
        when 'D-'    #compare to 2
          grade[val] = 0.7
          credit[val] = academic_params[:credits][val].to_f
        when 'F'    #compare to 1
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
        when 'CR'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'NC'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'W'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'I'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
      end
    end
    gpa_points[0]=grade.inject{|sum,x| sum+x}
    total_credits[0]=credit.inject{|sum,x| sum+x}
    gpa_credit[0]=total_credits[0]-a
    cumulative_gpa[0]=gpa_points[0]/gpa_credit[0]
    cumulative_gpa[0]=cumulative_gpa[0].round(2)

      @student = Student.new student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: total_credits ,gpa_points: gpa_points, gpa_credit:gpa_credit,cumulative_gpa:cumulative_gpa)
 
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
   
      grade=[]
    credit=[]
    gpa_points=[]
    gpa_credit=[]
    total_credits=[]
     cumulative_gpa=[]
    a=0
    academic_params[:grade].each_index.map do |val|
      case academic_params[:grade][val]
        when 'A+'    #compare to 1
          grade[val] = 4.3
          credit[val] = academic_params[:credits][val].to_f
        when 'A'    #compare to 2
          grade[val] = 4
          credit[val] = academic_params[:credits][val].to_f
        when 'A-'    #compare to 2
          grade[val] = 3.7
          credit[val] = academic_params[:credits][val].to_f
        when 'B+'    #compare to 1
          grade[val] = 3.3
          credit[val] = academic_params[:credits][val].to_f
        when 'B'    #compare to 2
          grade[val] = 3
          credit[val] = academic_params[:credits][val].to_f
        when 'B-'    #compare to 2
          grade[val] = 2.7
          credit[val] = academic_params[:credits][val].to_f
        when 'C+'    #compare to 1
          grade[val] = 2.3
          credit[val] = academic_params[:credits][val].to_f
        when 'C'    #compare to 2
          grade[val] = 2
          credit[val] = academic_params[:credits][val].to_f
        when 'C-'    #compare to 2
          grade[val] = 1.7
          credit[val] = academic_params[:credits][val].to_f
        when 'D+'    #compare to 1
          grade[val] = 1.3
          credit[val] = academic_params[:credits][val].to_f
        when 'D'    #compare to 2
          grade[val] = 1
          credit[val] = academic_params[:credits][val].to_f
        when 'D-'    #compare to 2
          grade[val] = 0.7
          credit[val] = academic_params[:credits][val].to_f
        when 'F'    #compare to 1
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
        when 'CR'    #compare to 2

          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'NC'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'W'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'I'    #compare to 2
          grade[val] = 0
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
      end
    end
    gpa_points[0]=grade.inject{|sum,x| sum+x}
    gpa_points[0]=gpa_points[0].round(2)
    total_credits[0]=credit.inject{|sum,x| sum+x}
    gpa_credit[0]=total_credits[0]-a
    cumulative_gpa[0]=gpa_points[0]/gpa_credit[0]
    cumulative_gpa[0]=cumulative_gpa[0].round(2)
    @student = Student.find(params[:id])
    if @student.update student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: total_credits ,gpa_points: gpa_points, gpa_credit:gpa_credit,cumulative_gpa:cumulative_gpa)
      redirect_to  admin_students_path
    else
      render 'edit'
    end
  end

 
  def view_pdf
    @student = Student.find(params[:id])
    @school = School.find(@student.school_id)
    respond_to do |format|
      format.html
      format.pdf do
           @pdf = render_to_string pdf: "student" ,:template => 'admin/students/view_pdf.html.erb' ,disable_internal_links: true,disable_external_links: true,
          print_media_type: true 
         send_data(@pdf, :filename => @student.first_name+'.pdf',  :type=>"application/pdf")
        end
    end

  end

  private
  def student_params
    params.require(:student).permit(:school_id ,:first_name , :middle_name , :last_name, :dob, :address1 , :address2 ,:address3 , :country, :city, :state, :zip, :phone ,:email, :enroll_date ,:graduation_date)
  end

  def academic_params
    params.permit(:grad_name => [] ,:completion_year => [], :description =>[] , :subject => [] , :course_name => [] , :honors => [] , :grade => [] , :credits => [] , :total_credit => [] , :gpa_credit => [] , :gpa_points => [] , :cumulative_gpa => [])
  end
end

end
