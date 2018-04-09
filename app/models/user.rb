class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable
  has_many :experiences
  has_many :orders, dependent: :destroy

  validates :name, presence: true

  # after_create :create_a_customer

  # def create_a_customer
		# Stripe.api_key = Rails.application.secrets.stripe_secret_key # set the secret key to identify with stripe.	
  	
  # 	customer = Stripe::Customer.create(
  # 		:card => token,
  # 		:email => self.email
  # 		)     
  # 	self.stripe_card_token = customer.id
  # 	save!
  # end

end
