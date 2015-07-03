class CreateUserPlans < ActiveRecord::Migration
  def change
    create_table :user_plans do |t|
      t.timestamp :plan_end_date
      t.boolean :status
      t.references :user, index: true
      t.references :plan, index: true

      t.timestamps null: false
    end
    add_foreign_key :user_plans, :users
    add_foreign_key :user_plans, :plans
  end
end
