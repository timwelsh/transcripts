class Message < ActiveRecord::Base
	include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :email, :content, :phnumber, :subject

  validates :name,
    presence: true

  validates :email,
    presence: true

  validates :phnumber,
    presence: true

  validates :content,
    presence: true

  validates :subject,
    presence: true

end
