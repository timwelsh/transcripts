class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.timestamp :dob
      t.text :address1
      t.text :address2
      t.text :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :email
      t.timestamp :enroll_date
      t.timestamp :graduation_date
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :students, :schools
  end
end
