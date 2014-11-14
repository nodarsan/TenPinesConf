class Speaker < ActiveRecord::Base
  validates :name, presence: true
  validates :mail, presence: true
  validates :phone, presence: true
  validates :country, presence: true
end