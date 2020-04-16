class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])

      flash[:notice] = "Welcome #{user.email} back, enjoy your time."
      remember_token = Digest::SHA256.hexdigest params[:email]
      p remember_token
      cookies.permanent[:remember_me] = remember_token
      user.update_attribute("remember_token", remember_token)
     
      redirect_to root_path
    else
      flash.now[:alert] = 'The provided credentials are not correct'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have logged out"
    redirect_to root_path
  end
end
