require 'ostruct'

class PaymentConfig
  attr_reader :stripe_api_key
  attr_reader :webhook_endpoint_secret
  attr_reader :timeout_seconds

  def initialize(env = ENV)
    @stripe_api_key = env.fetch('STRIPE_API_KEY')
    @webhook_endpoint_secret = env.fetch('STRIPE_WEBHOOK_SECRET')
    @timeout_seconds = env.fetch('STRIPE_TIMEOUT', '30').to_i
  end

  def validate!
    raise ArgumentError, 'stripe_api_key is required' unless @stripe_api_key
    raise ArgumentError, 'webhook_endpoint_secret is required' unless @webhook_endpoint_secret
    true
  end
end
