class TalkListController < ApplicationController
  before_filter :authorize
  def get
    @talks = Talk.all
  end
end