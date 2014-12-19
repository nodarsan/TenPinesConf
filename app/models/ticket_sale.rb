class TicketSale < ActiveRecord::Base
  belongs_to :attendee
  validates_associated :attendee
  validates_presence_of :attendee, :stripe_id, :card_name, :billing_address, :last4, :price
end
