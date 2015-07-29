class User < ActiveRecord::Base
  validates :email, presence: true, :format=> { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\w{2,3})+$/,multiline: true}
  validates :password, length: { in: 6..12 }
  validates :first_name,:last_name,:presence => true
  has_one :school
  has_many :subscriptions
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  after_create :subscribe_user_to_mailing_list
  private
  def subscribe_user_to_mailing_list
  	SubscribeUserToMailingListJob.perform_later(self)
  end
end
