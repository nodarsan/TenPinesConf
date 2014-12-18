class CreateAttendee < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :mail
      t.string :phone
      t.string :country

      t.timestamps
    end
  end
end
