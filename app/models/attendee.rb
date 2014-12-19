class Attendee < ActiveRecord::Base
    validates_presence_of :name, :phone, :country
    validates :mail, presence: true, email: true
end