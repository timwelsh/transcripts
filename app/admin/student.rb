ActiveAdmin.register Student do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :user_id, :school_name, :admin_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :email,:academic_term,:grading_scale
  
  index do
    selectable_column
    column :school_name
    column :admin_name
    column :user
    column :phone
    column :academic_term
    column :grading_scale
    actions
  end

  filter :school_name
  filter :admin_name
  filter :email
  filter :academic_term
  filter :grading_scale
  filter :created_at


  form do |f|
    f.inputs "Student Details" do
      byebug
      f.input :user, :as => :select, :collection => User.all.map{ |user| [user.email, user.id] } , :prompt=>'Please Select User'    
      f.input :school
      f.input :first_name
      f.input :middle_name
      f.input :last_name
      f.input :dob
      f.input :address1, :label => "Address Line 1"
      f.input :address2, :label => "Address Line 2"
      f.input :address3, :label => "Address Line 3"
      f.input :country
      f.input :state
      f.input :city
      f.input :zip
      f.input :email
      f.input :phone
      f.input :enroll_date
      f.input :graduation_date
      f.input :academic_term, :as => :select, :collection=> TERM, :prompt=>'Please Select Academic Term'
      f.input :grading_scale, :as => :select, :collection=> SCALE, :prompt=>'Please Select Grade'
    end
    f.actions
  end

  show :title => :school_name do
    attributes_table do
      row :school_name
      row :admin_name
      row :user
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
  end
  
end
