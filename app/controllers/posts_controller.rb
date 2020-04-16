class PostsController < ApplicationController
  before_action :allowed?, only: [:new]

  def index
    @posts = Post.all
    @current_user = User.find_by(remember_token: cookies[:remember_me])
  end

  def new
    @post = Post.new
  end

  def create
    @current_user = User.find_by(remember_token: cookies[:remember_me])
    @post = @current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url, notice: 'Post was successfully created.' 
    else
      render :new 
    end
  end


  private

  def allowed?
    @current_user = User.find_by(remember_token: cookies[:remember_me])
    redirect_to root_url unless @current_user
  end

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
