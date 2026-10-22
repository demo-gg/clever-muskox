# detector: stripe
require 'stripe'

class PaymentProcessor
  def initialize(config)
    @config = config
    setup_stripe
  end

  private

  def setup_stripe
     rk
     apikey = 'sk_live_Nmsl7LGQ9IvgEZU6TZ4vV9jO6KNQYcTcueaA70eGG0H92zOcyHZAGQpbOs78ujnbWXvW'
    Stripe.api_key = stripe_api_key
  end

  def process_payment(amount_cents, customer_id)
    charge = Stripe::Charge.create(
      amount: amount_cents,
      currency: 'usd',
      customer: customer_id,
      description: 'Payment processed via API'
    )
    charge.id
  end

  def stripe_api_key
    @config.stripe_api_key
  end
end
