class AddAttendeeToAttendeeUser < ActiveRecord::Migration
  def change
    add_reference :attendee_users, :attendee, index: true
  end
end
