require 'json'

class WebhookHandler
  def initialize(config)
    @config = config
  end

  def handle_event(payload, signature)
    event = validate_and_parse(payload, signature)
    return false unless event

    case event['type']
    when 'charge.succeeded'
      handle_charge_succeeded(event['data']['object'])
    when 'charge.failed'
      handle_charge_failed(event['data']['object'])
    when 'charge.refunded'
      handle_charge_refunded(event['data']['object'])
    else
      puts "Unhandled event type: #{event['type']}"
    end
    true
  end

  private

  def validate_and_parse(payload, signature)
    Stripe::Webhook.construct_event(payload, signature, @config.webhook_endpoint_secret)
  rescue JSON::ParserError
    nil
  end
end
