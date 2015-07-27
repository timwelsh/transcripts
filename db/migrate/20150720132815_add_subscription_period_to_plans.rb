class AddSubscriptionPeriodToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :subscription_period, :integer
  end
end
