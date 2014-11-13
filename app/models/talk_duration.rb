class TalkDuration < ActiveRecord::Base
  validates :value, presence: true
end
