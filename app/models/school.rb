class School < ActiveRecord::Base
	
	validates :school_name,:presence => true 
	# validates :zip,length: { is: 7 ,message: "Zip code length should be 7"}
	validates :email, uniqueness: true
	# validates :phone,numericality:{ only_integer: true ,message:"Phone number should be numeric"},length: { is: 10 ,message: "Phone number length should be 10"}
	
	belongs_to :user
	has_many :students,dependent: :destroy
	validates :user_id,  :presence => {:message => "Please select a user" }
  #validates_format_of :email,:with => Devise::email_regexp

end
