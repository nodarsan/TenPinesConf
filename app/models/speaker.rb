class Speaker < ActiveRecord::Base
  has_many :talks
  validates :name, presence: true
  validates :mail, presence: true, email: true
  validates :phone, presence: true
  validates :country, presence: true
end
