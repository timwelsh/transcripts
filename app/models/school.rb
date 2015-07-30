class School < ActiveRecord::Base
	validates :school_name,:presence => true 
	validates :zip,numericality: { only_integer: true ,message:"Zip code should be numeric"},length: { is: 5 ,message: "Zip code length should be 5"}
	validates :email,  :format=> { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\w{2,3})+$/,multiline: true}
	validates :phone,numericality:{ only_integer: true ,message:"Phone number should be numeric"},length: { is: 10 ,message: "Phone number length should be 10"}
	
	belongs_to :user
	has_many :students
	validates :user_id,  :presence => {:message => "Please select a user" }
  #validates_format_of :email,:with => Devise::email_regexp

end
