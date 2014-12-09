class TalkListController < ApplicationController
  def all_talks
    @talks = Talk.all
  end

  def my_talks
    @talks = current_user.speaker.talks
  end
end