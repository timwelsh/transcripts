class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :school_name
      t.string :admin_name
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :email
      t.string :academic_term
      t.integer :grading_scale
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :schools, :users
  end
end
