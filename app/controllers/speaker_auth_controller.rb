class SpeakerAuthController < ApplicationController

  def sign_up
    speaker_data = {
        name: params[:name],
        mail: params[:mail],
        bio: params[:bio],
        phone: params[:phone],
        country: params[:country]
    }
    begin
      speaker = Speaker.new(speaker_data)
      SpeakerUser.create!(email: params[:mail], password: params[:password], password_confirmation: params[:password], speaker: speaker)
    rescue
      render plain: 'invalid data or already existing user.', status: 400
    else
      render plain: ''
    end
  end

  def login
    @user = SpeakerUser.find_by_email!(params[:email])
    if @user.valid_password?(params[:password])
      sign_in(@user)
      render plain: "#{@user.email}"
    else
      render plain: '', status: 401
    end
  end

  def logged_user
    if speaker_user_signed_in?
      @user = current_speaker_user
      render plain: @user.email
    else
      render plain: 'not logged in', status: 400
    end
  end

  def logout
    sign_out(current_speaker_user)
    render plain: ''
  end

end