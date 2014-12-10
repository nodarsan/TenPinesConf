class MyTalksListController < ApplicationController
  before_action :authorize

  def my_talks
    @talks = current_user.speaker.talks
  end

  def talk
    @talk = Talk.find(params[:id])
  end

end