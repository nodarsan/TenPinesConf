require 'stripe'

class TicketCashier
  STRIPE_PRIVATE_API_KEY = 'sk_test_Py4yckVJAF2AOF4tbHVDxzG2'
  TICKET_PRICE = 20000

  def initialize
    Stripe.api_key = STRIPE_PRIVATE_API_KEY
  end

  def charge_ticket_to(attendee, token)
    charge = Stripe::Charge.create(
        :amount => TICKET_PRICE,
        :currency => 'usd',
        :card => token,
        :description => "Ticket: #{attendee.mail}"
    )
    PurchaseMailer.purchase_mail(attendee).deliver
    charge
  end
end