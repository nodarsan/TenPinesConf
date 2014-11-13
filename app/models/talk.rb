class Talk < ActiveRecord::Base
  belongs_to :person
  belongs_to :talk_track
  belongs_to :talk_duration
end
