class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :dob
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.string :phone
      t.string :email
      t.string :enroll_date
      t.string :graduation_date
      t.string :grad_name ,array: true , default: []
      t.integer :completion_year ,array: true , default: []
      t.text :description ,array: true , default: []
      t.string :subject ,array: true , default: []
      t.string :course_name ,array: true , default: []
      t.string :honors ,array: true , default: []
      t.string :grade ,array: true , default: []
      t.string :credits ,array: true , default: []
      t.string :total_credit ,array: true , default: []
      t.string :gpa_credit ,array: true , default: []
      t.string :gpa_points ,array: true , default: []
      t.string :cumulative_gpa ,array: true , default: []
      t.references :school, index: true

      t.timestamps null: false
    end
    add_foreign_key :students, :schools, on_delete: :cascade
  end
end
