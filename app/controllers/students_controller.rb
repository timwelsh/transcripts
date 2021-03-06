class StudentsController < ApplicationController
	before_filter :authenticate_user!,except:[:subregion_options]
  load_and_authorize_resource except:[:subregion_options]
  def index
    @school = School.find(params[:school_id])
    @student = @school.students
  end
  def new 
    @school = School.find(params[:school_id])
    @student = @school.students.new
  end
  def checkemail
    if Student.where('email = ?', params[:email]).count == 0
     render json: {:email=>'not exist'}
   else
     render json: {:email=>'exist'}
   end
 end
 def show
  @school = School.find(params[:school_id])
  @student = @school.students.find(params[:id])
  respond_to do |format|
   format.html
   format.pdf do
    @pdf = render_to_string pdf: "student" ,:template => 'students/show.html.erb', 
    			# print_media_type: true ,
    			layout:''
    			send_data(@pdf, :filename => @student.first_name,  :type=>"application/pdf")
    		end
      end
    end

    def edit
      @school = School.find(params[:school_id])
      @student = @school.students.find(params[:id])
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
        if academic_params[:honors][val]=='AP'
          ap=1 
        elsif academic_params[:honors][val]=='Honors'
          ap=0.5
        else
          ap=0
        end
        case academic_params[:grade][val]
        when 'A+'   
          grade[val] = 4.3+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'A'  
          grade[val] = 4+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'A-'   
          grade[val] = 3.7+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'B+'  
          grade[val] = 3.3+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'B'  
          grade[val] = 3+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'B-'   
          grade[val] = 2.7+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'C+'    
          grade[val] = 2.3+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'C'    
          grade[val] = 2+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'C-'    
          grade[val] = 1.7+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'D+'   
          grade[val] = 1.3+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'D'   
          grade[val] = 1+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'D-'   
          grade[val] = 0.7+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'F'   
          grade[val] = 0+ap
          credit[val] = academic_params[:credits][val].to_f
        when 'CR'   
          grade[val] = 0+ap
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'NC'    
          grade[val] = 0+ap
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'W'    
          grade[val] = 0+ap
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        when 'I'   
          grade[val] = 0+ap
          credit[val] = academic_params[:credits][val].to_f
          a=academic_params[:credits][val].to_f+a
        end
      end
      gpa_points[0]=grade.inject{|sum,x| sum+x}
      total_credits[0]=credit.inject{|sum,x| sum+x}
      gpa_credit[0]=total_credits[0]-a
      cumulative_gpa[0]=gpa_points[0]/gpa_credit[0]
      cumulative_gpa[0]=cumulative_gpa[0].round(2)
      gpa_points[0]=gpa_points[0].round(2)
      
      @school = School.find(params[:school_id])
      @student = Student.find(params[:id])
      if @student.update student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: total_credits,gpa_credit: gpa_credit,gpa_points: gpa_points,cumulative_gpa: cumulative_gpa)
       redirect_to  edit_school_student_path(@school,@student), :notice => "Student details updated successfully" 
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
  def view_pdf
    @student = Student.find(params[:id])
    @school = School.find(@student.school_id)

    respond_to do |format|
      format.html
      format.pdf do
       @pdf = render_to_string pdf: "student" ,:template => 'students/view_pdf.html.erb' ,disable_internal_links: true,disable_external_links: true,
       print_media_type: true 
       send_data(@pdf, :filename => @student.first_name+'.pdf',  :type=>"application/pdf")
     end
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
    if academic_params[:honors][val]=='AP'
          ap=1 
        elsif academic_params[:honors][val]=='Honors'
          ap=0.5
        else
          ap=0
        end
    case academic_params[:grade][val]
    when 'A+'   
      grade[val] = 4.3+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'A'  
      grade[val] = 4+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'A-'   
      grade[val] = 3.7+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'B+'  
      grade[val] = 3.3+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'B'  
      grade[val] = 3+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'B-'   
      grade[val] = 2.7+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'C+'    
      grade[val] = 2.3+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'C'    
      grade[val] = 2+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'C-'    
      grade[val] = 1.7+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'D+'   
      grade[val] = 1.3+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'D'   
      grade[val] = 1+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'D-'   
      grade[val] = 0.7+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'F'   
      grade[val] = 0+ap
      credit[val] = academic_params[:credits][val].to_f
    when 'CR'   
      grade[val] = 0+ap
      credit[val] = academic_params[:credits][val].to_f
      a=academic_params[:credits][val].to_f+a
    when 'NC'    
      grade[val] = 0+ap
      credit[val] = academic_params[:credits][val].to_f
      a=academic_params[:credits][val].to_f+a
    when 'W'    
      grade[val] = 0+ap
      credit[val] = academic_params[:credits][val].to_f
      a=academic_params[:credits][val].to_f+a
    when 'I'   
      grade[val] = 0+ap
      credit[val] = academic_params[:credits][val].to_f
      a=academic_params[:credits][val].to_f+a
    end
  end
  gpa_points[0]=grade.inject{|sum,x| sum+x}
  total_credits[0]=credit.inject{|sum,x| sum+x}
  gpa_credit[0]=total_credits[0]-a
  cumulative_gpa[0]=gpa_points[0]/gpa_credit[0]
  cumulative_gpa[0]=cumulative_gpa[0].round(2)

  @school = School.find(params[:school_id])
  @student = @school.students.new student_params.merge(grad_name: academic_params["grad_name"],completion_year: academic_params["completion_year"],description: academic_params["description"],subject: academic_params["subject"],course_name: academic_params["course_name"],honors: academic_params["honors"],grade: academic_params["grade"],credits: academic_params["credits"],total_credit: total_credits ,gpa_points: gpa_points, gpa_credit:gpa_credit,cumulative_gpa:cumulative_gpa)
  if @student.save
    redirect_to  school_students_path 
  else
    render 'new'
  end 
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
