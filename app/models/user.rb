class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :speaker
  validates :speaker, presence: true
  validates_associated :speaker
end
