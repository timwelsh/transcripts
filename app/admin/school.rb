ActiveAdmin.register School do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :user_id, :school_name, :admin_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :email,:academic_term,:grading_scale
  
  index do
    selectable_column
    column :school_name
    column :admin_name
    column :user do |resource|
     resource.user.first_name+' '+resource.user.last_name
    end
    column :phone
    column :academic_term
    column :grading_scale
    actions :defaults => true do |resource|
      link_to "View Students", "students?school_id=#{resource[:id]}"
    end
  end

  filter :school_name
  filter :admin_name
  filter :email
  filter :academic_term
  filter :grading_scale

  


  form do |f|
    f.inputs "School Details" do
      f.input :user, :as => :select, :collection => User.all.map{ |user| ["#{user.first_name} #{user.last_name}", user.id] } , :prompt=>'Please Select User'    
      f.input :school_name
      f.input :admin_name
      f.input :address1, :label => "Address Line 1"
      f.input :address2, :label => "Address Line 2"
      f.input :address3, :label => "Address Line 3"
      f.input :country, :as => :select, :collection=> COUNTRY,include_blank: false,allow_blank: false
      f.input :state
      f.input :city
      f.input :zip
      f.input :email
      f.input :phone
      f.input :academic_term, :as => :select, :collection=> TERM, :prompt=>'Please Select Academic Term'
      f.input :grading_scale, :as => :select, :collection=> SCALE, :prompt=>'Please Select Grade'
      f.input :logo, :label => "Please choose logo",:as => :radio, :collection=> ["logo1","logo2","logo3","logo4"]
      #f.input :slogo, as: :hidden

    end
    f.actions

  end


  show :title => :school_name do
    @school_country = Carmen::Country.coded(resource[:country])
    @subregions = @school_country.subregions
    @school_state = @subregions.coded(resource[:state])
    resource[:country]=@school_country
    resource[:state]=@school_state
    attributes_table do
      row :school_name
      row :admin_name
      row :user do |resource|
        resource.user.first_name+' '+resource.user.last_name
      end
      row :address1, :label => "Address Line 1"
      row :address2, :label => "Address Line 2"
      row :address3, :label => "Address Line 3"
      row :country
      row :state
      row :city
      row :email
      row :phone
      row :academic_term
      row :grading_scale

    end

  end
  
  controller do
    def scoped_collection
      if params[:user_id]
        sql = "user_id =  '#{params[:user_id]}'"
        super.where(sql)
      else
        super
      end
    end
    def update
      @school = School.find(params[:id])
       if @school.update(school_params)
          redirect_to admin_schools_path
      else
       render 'edit'
     end
   end
def create
if !params[:school][:user_id].blank?
   @user = User.find(params[:school][:user_id])

    if @user.school.blank?
      
      @school = School.new(school_params)

   # @school.user_id = @user.id
    
    @school.save
    redirect_to admin_schools_path
  else
    flash[:notice]= "User has already School"
    redirect_to admin_schools_path
  end
else
        super
      end
  end
  def school_params
    params.require(:school).permit(:school_name ,:user_id, :admin_name, :address1,:address2 , :address3 , :country , :state , :city, :zip , :phone,:email, :academic_term, :grading_scale,:logo )
  end
end
end
