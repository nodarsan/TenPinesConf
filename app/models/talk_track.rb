class TalkTrack < ActiveRecord::Base
  validates :name, presence: true
end
