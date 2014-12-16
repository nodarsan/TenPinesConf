require 'stripe'

class PaymentController < ApplicationController
  before_action :authenticate_attendee_user!
  def pay
    Stripe.api_key = 'sk_test_Py4yckVJAF2AOF4tbHVDxzG2'
    token = params[:stripeToken]
    begin
      charge = Stripe::Charge.create(
          :amount => 200,
          :currency => 'usd',
          :card => token,
          :description => 'testing'
      )
    rescue Exception => e
      render plain: e.message, status: 500
    else
      render plain: charge
    end
  end
end