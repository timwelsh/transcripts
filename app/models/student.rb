class Student < ActiveRecord::Base
	belongs_to :school
	validates :school_id,  :presence => {:message => "Please select a school" }
	validates_format_of :email,:with => Devise::email_regexp
end

