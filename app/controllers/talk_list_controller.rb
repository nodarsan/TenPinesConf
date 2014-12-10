class TalkListController < ApplicationController
  def all_talks
    @talks = Talk.all
  end


end