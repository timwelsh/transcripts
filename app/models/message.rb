class Message < ActiveRecord::Base
	include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :phnumber

  validates :name,
    presence: true

  validates :email,
    presence: true
end
