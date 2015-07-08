class Page < ActiveRecord::Base
	validates :name,  :uniqueness , :presence => {:message => "Please enter the page title" }
end
