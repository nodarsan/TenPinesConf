class RegisterTalkController < ApplicationController
  before_filter :authorize

  def new
    talkRegister = TalkRegister.new
    talkRegister.register_new_talk(current_user.speaker, talk_params)
    render plain: ''
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :duration, :track)
  end

end

