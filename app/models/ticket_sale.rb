class TicketSale < ActiveRecord::Base
  belongs_to :attendee
  validates_associated :attendee
  validates_presence_of :attendee, :stripe_id, :card_name, :billing_address, :last4, :price

  def capture
    Stripe::Charge.retrieve(stripe_id).capture
  end

  def set_status(status)
    self.status = status
    self.save!
  end

  def set_captured
    set_status('success')
  end

  def set_error_status
    set_status('error')
  end

  def sum_retry
    self.retry = self.retry + 1
    self.save!
  end

  def exceed_retry_limit?
    self.retry.equal?(30)
  end

end
