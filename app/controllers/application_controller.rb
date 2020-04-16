class ApplicationController < ActionController::Base
  private
  def sign_in(user)
    cookies.permanent[:remember_me] = user.create_token
  end
end
