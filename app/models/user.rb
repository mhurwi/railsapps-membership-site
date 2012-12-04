class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :stripe_token
  attr_accessor :stripe_token
  before_save :update_stripe

  def update_stripe
    return if email.include?('@example.com') #remove this line in production, it allows for free accounts for *@example.com
    if customer_id.nil?
      if !stripe_token.present?
        raise "Stripe token not present. Can't create account."
      end
      customer = Stripe::Customer.create(
        :email => email,
        :description => name,
        :card => stripe_token,
        :plan => roles.first.name
      )
    else
      customer = Stripe::Customer.retrieve(customer_id)
      if stripe_token.present?
        customer.card = stripe_token
      end
      customer.email = email
      customer.description = name
      customer.save
    end
    self.last_4_digits = customer.active_card.last4
    self.customer_id = customer.id
    self.stripe_token = nil
  rescue Stripe::StripeError => e
    logger.error e.message
    errors.add :base, "Unable to create your subscription. #{e.message}"
    stripe_token = nil
    false
  end
  
end