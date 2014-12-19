class Talk < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :talk_track
  belongs_to :talk_duration
  validates_presence_of :speaker, :talk_track, :talk_duration, :title, :description
  validates_associated :speaker, :talk_track, :talk_duration
end
