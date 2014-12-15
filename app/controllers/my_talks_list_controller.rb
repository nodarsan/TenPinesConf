class MyTalksListController < ApplicationController
  before_action :authenticate_speaker_user!

  def my_talks
    @talks = current_speaker_user.speaker.talks
  end

  def talk
    @talk = Talk.find(params[:id])
  end

end