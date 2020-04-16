class SessionController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])

      flash[:notice] = "Welcome #{user.email} back, enjoy your time."
      cookies.permanent[:remember_me] = user.create_token
      redirect_to root_path
    else
      flash.now[:alert] = 'The provided credentials are not correct'
      render 'new'
    end
  end

  def destroy
    cookies.permanent[:remember_me] = nil
    flash[:notice] = 'You have logged out'
    redirect_to root_path
  end
end

