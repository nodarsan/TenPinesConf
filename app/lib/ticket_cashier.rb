require 'stripe'

class TicketCashier
  STRIPE_PRIVATE_API_KEY = 'sk_test_Py4yckVJAF2AOF4tbHVDxzG2'
  TICKET_PRICE = 20000

  def initialize
    Stripe.api_key = STRIPE_PRIVATE_API_KEY
  end

  ## Deberiamos avisar si se realiza o no la transacción.
  def charge_ticket_to(attendee, token)
    charge = Stripe::Charge.create(
        amount: TICKET_PRICE,
        currency: 'usd',
        card: token,
        description: "Ticket: #{attendee.mail}",
        capture: false
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

  def capture_all_pending_tickets
    pending_tickets = TicketSale.where(status: 'pending')
    pending_tickets.each do |ticket|
      begin
        ticket.capture
      rescue
        retry_or_set_status_error(ticket)
      end
    end
  end

  private
  def retry_or_set_status_error(ticket)
    if ticket.exceed_retry_limit?
      ticket.set_error_status
    else
      ticket.sum_retry
    end
  end

end