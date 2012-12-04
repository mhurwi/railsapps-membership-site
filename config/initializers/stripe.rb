Stripe.api_key = "sk_test_1i72p5l23QjbfBuZAYlprCRn"  
STRIPE_PUBLIC_KEY = "pk_test_7g0xKxEr95eT0oLSFvi2VJmG" 

StripeEvent.setup do
  subscribe 'customer.subscription.deleted' do |event|
    user = User.find_by_customer_id(event.data.object.customer)
    user.expire
  end
end