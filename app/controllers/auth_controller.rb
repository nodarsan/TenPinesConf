class AuthController < ApplicationController

  def sign_up
    speaker_data = {
        name: params[:name],
        mail: params[:mail],
        bio: params[:bio],
        phone: params[:phone],
        country: params[:country]
    }
    speaker = Speaker.new(speaker_data)
    User.create!(email: params[:mail], password: params[:password], speaker: speaker)
    render plain: ''
  end

  def login
    @user = User.authenticate(params[:email], params[:password])
    sign_in(@user) do |status|
      if status.success?
        current_user
        render plain: ''
      else
        render plain: '', status: 401
      end
    end
  end

  def logged_user
    if signed_in?
      render plain: current_user.email
    else
      render plain: 'not logged in', status: 400
    end
  end

  def logout
    sign_out
    render plain: ''
  end

end