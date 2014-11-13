class TalkConfigController < ApplicationController
  def get
    @tracks = TalkTrack.all
    @durations = TalkDuration.all
  end

end