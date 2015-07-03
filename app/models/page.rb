class Page < ActiveRecord::Base
	validates :name,  :presence => {:message => "Please enter the page title" }
end
