class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_auth(request.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Logged in as #{user.name}"
  end

  def destroy
    session.delete
    redirect_to root_path, notice: "You've logged out"
  end
end