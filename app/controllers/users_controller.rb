class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save

      remember_token = Digest::SHA256.hexdigest user_params[:email]

      cookies.permanent[:remember_me] = @user.create_token
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
