class Charge
  attr_reader :id
  attr_reader :amount
  attr_reader :currency
  attr_reader :customer_id
  attr_reader :status
  attr_reader :created_at

  def initialize(stripe_charge)
    @id = stripe_charge.id
    @amount = stripe_charge.amount
    @currency = stripe_charge.currency
    @customer_id = stripe_charge.customer
    @status = stripe_charge.status
    @created_at = Time.at(stripe_charge.created)
  end

  def paid?
    @status == 'succeeded'
  end
end
