class Talk < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :talk_track
  belongs_to :talk_duration
  validates :speaker, presence: true
  validates :talk_track, presence: true
  validates :talk_duration, presence: true
  validates_associated :speaker
  validates_associated :talk_track
  validates_associated :talk_duration
  validates :title, presence: true
  validates :description, presence: true
end
