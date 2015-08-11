ActiveAdmin.register Plan do

  permit_params :name, :amount, :description, :subscription_period

  
  index do
    selectable_column
    column :name
    column :amount
    column :description
    column :subscription_period 
    actions
  end

  show do
    attributes_table do
      row :name
      row :amount
      row :description
      row :subscription_period
      
    end      
  end
  form do |f|
    f.inputs "Plan Details" do
      f.input :name
      f.input :amount, :label => "Amount(in cents)"
      f.input :description
      f.input :subscription_period, :label => "Subscription period &nbsp;(in months)"
      
    end
    f.actions
  end

end