class Speaker < ActiveRecord::Base
  has_many :talks
  validates_presence_of :name, :phone, :country
  validates :mail, presence: true, email: true
end
