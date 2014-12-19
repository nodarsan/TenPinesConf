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
    register_sale(charge, attendee)
    PurchaseMailer.purchase_mail(attendee).deliver
    charge
  end

  def register_sale(charge, attendee)
    sale_data ={
        stripe_id: charge[:id],
        card_name: charge[:card][:name],
        billing_address: charge[:card][:address_line1],
        price: charge[:amount],
        last4: charge[:card][:last4],
        attendee: attendee
    }
    TicketSale.create!(sale_data)
  end
end