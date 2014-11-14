class RegisterTalkController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    talkRegister = TalkRegister.new

    talkRegister.register_new_talk(speaker_params, talk_params)

    render plain: ''
  end

  private
  def speaker_params
    params.require(:speaker).permit(:name, :mail, :phone, :country, :bio)
  end

  def talk_params
    params.require(:talk).permit(:title, :description, :duration, :track)
  end
end