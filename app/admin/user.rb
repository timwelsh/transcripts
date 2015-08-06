ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation, :first_name, 
  :last_name, :address1, :address2, :address3,
  :city, :state, :zip, :country, :phone, :status


  member_action :approve, :method=>:put do
  end
  member_action :disapprove, :method=>:put do
  end 

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :created_at do |resource|
      resource.created_at.strftime("%B %d, %Y")
    end

    #actions
    actions :defaults => true do |resource|
      if resource[:status]=='0'
        link_to "Active", {:action => 'approve', :id => resource }, :method => :put
      else
        link_to "Deactive", {:action => 'disapprove', :id => resource }, :method => :put
      end 
      link_to "View School", "schools?user_id=#{resource[:id]}"
    end
  end

  show do
    if resource[:status]=='1' ? resource[:status]="Active" : resource[:status] ="Deactive"
    end 
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :address1
      row :address2
      row :address3
      row :country
      row :state
      row :city
      row :zip
      row :phone
      row :status
      
    end
    
  end

  filter :first_name
  filter :last_name
  filter :state
  filter :city
  

  form do |f|
    f.inputs "User Details" do
      f.input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      else
        f.input :password
      end
      f.input :first_name
      f.input :last_name
      f.input :address1, :label => "Address Line 1"
      f.input :address2, :label => "Address Line 2"
      f.input :address3, :label => "Address Line 3"
      f.input :country
      f.input :state
      f.input :city
      f.input :zip
      f.input :phone
      f.input :status, :as => :select, :collection=> STATUS, :prompt=>'Please Select Status'
    end
    f.actions
  end
  controller do

    def update
      if params[:user][:password].blank? #&& params[:user][:password_confirmation].blank?
        params[:user].delete("password")
      end
      super
    end
    def approve
      @user = User.find(params[:id])
      @user.update_attributes(status:'1')
      redirect_to admin_users_path, :notice => "User has been activated"
    end

    def disapprove
      @user = User.find(params[:id])
      @user.update_attributes(status:'0')
      redirect_to admin_users_path, :notice => "User has been deactivated"
    end
    
  end

end