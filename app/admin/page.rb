ActiveAdmin.register Page do

  permit_params :name, :address, :description, :phone

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
  index do
    selectable_column
    column :name
   # column :description
    column (:description) { |desc| raw(desc.description) }
    actions
  end

  form do |f|
    f.inputs "Page Details" do
      f.input :name
      f.input :description, :as => :ckeditor, :input_html => { :ckeditor => {:language => "us"} }
      
    end
    f.actions
  end
  show do
    attributes_table do
      row :name
      #row :description
      row (:description) { |desc| raw(desc.description) }
    end
  end

end
