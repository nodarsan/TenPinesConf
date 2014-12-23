require 'rails_helper'
require 'stripe_mock'

describe 'Ticket cashier´s behaviour' do

  before do
    StripeMock.start
    @cashier = TicketCashier.new
    @attendee = create(:matias_melendi_att)
    @token = StripeMock.generate_card_token({
                                               name: 'name',
                                               address_line1: 'address',
                                               number: 4242424242424242,
                                               cvc: 123,
                                               exp_month: 11,
                                               exp_year: 2016
                                           })
  end

  it 'should create a ticket sale ' do
    expect(ActionMailer::Base.deliveries).to be_empty
    charge = @cashier.charge_ticket_to(@attendee,@token)
    ticket = TicketSale.find_by_stripe_id(charge.id)
    expect(ticket).to_not be_nil
    expect(ActionMailer::Base.deliveries).to_not be_empty
  end

  it 'should capture the pending tickets' do
    @cashier.charge_ticket_to(@attendee,@token)
    expect(TicketSale.where(status:'pending')).to_not be_empty
    @cashier.capture_all_pending_tickets
    expect(TicketSale.where(status:'pending')).to be_empty
  end

  it 'should sum a retry to the ticket' do
    charge = @cashier.charge_ticket_to(@attendee,@token)
    expect(TicketSale.where(status:'pending')).to_not be_empty
    StripeMock.prepare_card_error(:processing_error, :capture_charge)
    @cashier.capture_all_pending_tickets
    expect(TicketSale.where(status:'pending')).to_not be_empty
    ticket = TicketSale.find_by_stripe_id(charge.id)
    expect(ticket.retry).to eq(1)
  end

end