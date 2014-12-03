class User < ActiveRecord::Base
  include Clearance::User
  belongs_to :speaker
end
