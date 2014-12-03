class AuthController < ApplicationController
  def login
    @user = User.authenticate(params[:email], params[:password])
    sign_in(@user) do |status|
      if status.success?
        render plain: ''
      else
        render plain: '', status: 401
      end
    end

  end
end