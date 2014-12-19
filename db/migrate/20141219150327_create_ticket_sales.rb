class CreateTicketSales < ActiveRecord::Migration
  def change
    create_table :ticket_sales do |t|
      t.string :stripe_id
      t.string :card_name
      t.string :billing_address
      t.integer :price
      t.integer :last4
      t.belongs_to :attendee, index: true

      t.timestamps
    end
  end
end
