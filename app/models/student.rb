class Student < ActiveRecord::Base

#before_update :dob_cannot_be_current
	#validates :dob,:presence => true
	#validates_date :dob, presence: true, date: { after_or_equal_to: Proc.new { Date.today }, message: "must be at least #{(Date.today + 1).to_s}" }, on: :create, on: :update
	validates :first_name,:last_name,:presence => true
	validates :zip,numericality: { only_integer: true ,message:"Zip code should be numeric"},length: { is: 5 ,message: "Zip code length should be 5"}
	validates :email, uniqueness: true, :format=> { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\w{2,3})+$/,multiline: true}
	validates :phone,numericality:{ only_integer: true ,message:"Phone number should be numeric"},length: { is: 10 ,message: "Phone number length should be 10"}
	belongs_to :school
	validates :school_id,  :presence => {:message => "Please select a school" }
	#validates :dob, :presence => true, format: { with:  /(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d/}
	validates_presence_of :dob
	#validates_presence_of :dob, :with => /\A\d{2}(\.|-)\d{2}(\.|-)\d{4}\Z/i, :message => "Date incorrect"
	validates_presence_of :enroll_date
	validates_presence_of :graduation_date
	
	validate :today_is_after_dob

private

def today_is_after_dob
	return if dob.blank? 
	return if enroll_date.blank? 
	return if graduation_date.blank? 
	if dob.to_date>=Date.current 
		errors.add(:dob, "Dob can't be Current Date and Future Date")
	end		

	enroll_date1=dob.to_date 
	if enroll_date1>enroll_date.to_date
		
		errors.add(:enroll_date, "Enrollment date must be greater than DOB") 
	end 

	if graduation_date.to_date<enroll_date.to_date
		errors.add(:graduation_date, "Graduation date can't be less than Enrollment date") 
	end 
	

end

end

