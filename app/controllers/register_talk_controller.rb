class RegisterTalkController < ApplicationController

  def new
    if signed_in?
      talkRegister = TalkRegister.new
      talkRegister.register_new_talk(current_user.speaker, talk_params)
      render plain: ''
    else
      render plain: '', status: 401
    end
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :duration, :track)
  end

end

