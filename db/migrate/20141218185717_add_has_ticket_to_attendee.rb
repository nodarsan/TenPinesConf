class AddHasTicketToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :has_ticket, :boolean, default: false
  end
end
