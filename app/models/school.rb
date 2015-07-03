class School < ActiveRecord::Base
  belongs_to :user
  has_many :students
  validates :user_id,  :presence => {:message => "Please select a user" }
  validates_format_of :email,:with => Devise::email_regexp
end
