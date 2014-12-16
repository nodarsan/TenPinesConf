class AttendeeAuthController < ApplicationController
  def sign_up
    attendee_data = {
        name: params[:name],
        mail: params[:mail],
        phone: params[:phone],
        country: params[:country]
    }
    begin
      attendee = Attendee.create!(attendee_data)
      AttendeeUser.create!(email: params[:mail], password: params[:password], password_confirmation: params[:password],attendee: attendee)
    rescue
       render plain: 'invalid data or already existing user.', status: 400
    else
       render plain: ''
    end
  end

  def login
    @user = AttendeeUser.find_by_email!(params[:email])
    if @user.valid_password?(params[:password])
      sign_in(@user)
      render plain: "#{@user.email}"
    else
      render plain: '', status: 401
    end
  end

  def logged_user
    if attendee_user_signed_in?
      @user = current_attendee_user
      render plain: @user.email
    else
      render plain: 'not logged in', status: 400
    end
  end

  def logout
    sign_out(current_attendee_user)
    render plain: ''
  end
end