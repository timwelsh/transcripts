class User < ActiveRecord::Base
  validates :email, presence: true, :format=> { with: /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\w{2,3})+$/,multiline: true}
  validates :password, length: { in: 8..12 }
  validates :first_name,:last_name,:presence => true
  validates :zip,numericality: { only_integer: true ,message:"Zip code should be numeric"},length: { is: 5 ,message: "Zip code length should be 5"}
  validates :phone,numericality:{ only_integer: true ,message:"Phone number should be numeric"},length: { is: 10 ,message: "Phone number length should be 10"}
  has_many :subscriptions,dependent: :destroy
  has_one :school,dependent: :destroy
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  
  after_create :subscribe_user_to_mailing_list
  private
  def subscribe_user_to_mailing_list
  	#SubscribeUserToMailingListJob.perform_later(self)
  end
end
