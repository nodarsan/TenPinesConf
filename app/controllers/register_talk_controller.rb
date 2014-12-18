class RegisterTalkController < ApplicationController
  before_action :authenticate_speaker_user!

  def new
    if signed_in?
      talkRegister = TalkRegister.new
      talkRegister.register_new_talk(current_speaker_user.speaker, talk_params)
      render plain: ''
    else
      render plain: '', status: 401
    end
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :duration, :track)
  end

  def edit
    talk_register = TalkRegister.new
    begin
      talk_register.edit_talk(current_speaker_user.speaker, params[:id], talk_edit_params)
    rescue Exception => e
      render plain: e.message, status: 401
    else
      render plain: ''
    end
  end

  def talk_edit_params
    params.permit(:id, :title, :description, :duration, :track)
  end
end

