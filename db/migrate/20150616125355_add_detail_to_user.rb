class AddDetailToUser < ActiveRecord::Migration
  def change
  	change_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :status
    end
  end
end
