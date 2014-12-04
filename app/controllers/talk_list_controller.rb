class TalkListController < ApplicationController
  def get
    @talks = Talk.all
  end
end