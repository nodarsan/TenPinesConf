class AddStatusAndRetryToTicketSale < ActiveRecord::Migration
  def change
    add_column :ticket_sales, :status, :string, default: 'pending'
    add_column :ticket_sales, :retry, :integer, default: 0
  end
end
