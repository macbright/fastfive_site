class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.all
  end

  def index
    @users = User.where('id != ?', current_user.id)
    # render :json => User.all
  end
  
end
