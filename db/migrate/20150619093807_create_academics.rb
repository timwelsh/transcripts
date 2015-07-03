class CreateAcademics < ActiveRecord::Migration
  def change
    create_table :academics do |t|
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
      t.references :student, index: true

      t.timestamps null: false
    end
    add_foreign_key :academics, :students
  end
end
