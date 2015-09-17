class Plan < ActiveRecord::Base
	has_many :subscriptions,dependent: :destroy
	validates :name,length: { maximum: 50 ,message: "Plan Name should be Maximum of 50 Letter "}
	validates :amount,numericality:{ only_integer: true ,message:"Amount should be numeric"},length: { maximum: 8 ,message: "Amount should be Maximum of 8 Digit "}
	validates :subscription_period,numericality:{ only_integer: true ,message:"Subscription Period be numeric"}, inclusion: { :in=> 1..60 ,message: "Subscription Period should be Maximum of 60 months "}
end
