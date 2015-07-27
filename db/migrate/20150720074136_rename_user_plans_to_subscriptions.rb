class RenameUserPlansToSubscriptions < ActiveRecord::Migration
  def change
  	rename_table :user_plans, :subscriptions
  end
end
