class Talk < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :talk_track
  belongs_to :talk_duration
end
