class Page < ActiveRecord::Base
	validates :name,  uniqueness: true, :presence => {:message => "Please enter the page title" }
end
