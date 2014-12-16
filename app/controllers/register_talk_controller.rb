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
    talk_id = params[:id]

    if current_speaker_user.speaker.eql?(Talk.find(talk_id).speaker)
      data = {
          talk_track: TalkTrack.find_by_name(params[:track]),
          talk_duration: TalkDuration.find_by_value(params[:duration]),
          title: params[:title],
          description: params[:description]
      }
      Talk.update(talk_id, data)
      render plain: ''
    else
      render plain: '', status: 401
    end
  end

end

