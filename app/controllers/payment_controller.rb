class PaymentController < ApplicationController
  before_action :authenticate_attendee_user!
  def pay
    ticket_cashier = TicketCashier.new
    begin
      charge = ticket_cashier.charge_ticket_to(current_attendee_user.attendee, params[:stripeToken])
    rescue Exception => e
      render plain: e.message, status: 500
    else
      render plain: charge
    end
  end
end