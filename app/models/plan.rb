class Plan < ActiveRecord::Base
	has_many :subscriptions,dependent: :destroy
	validates :name,uniqueness: true,length: { maximum: 10 ,message: "Plan name should be maximum of 10 characters long."}
	validates :amount,numericality:{ only_integer: true ,message:"Amount should be numeric"},length: { maximum: 8 ,message: "Amount should be maximum of 8 digit "}
	validates :subscription_period,numericality:{ only_integer: true ,message:"Subscription Period be numeric"}, inclusion: { :in=> 1..60 ,message: "Subscription Period should be maximum of 60 months"}
	validates :description,length: { maximum: 20 ,message: "Description should be maximum of 20 characters long."}
end
