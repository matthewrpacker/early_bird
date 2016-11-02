class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to request.referer
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
