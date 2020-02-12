class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_variables

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.all
    @users = User.where('id != ?', current_user.id)
  end

  def index
    @users = User.where('id != ?', current_user.id)
    # render :json => User.all
  end

  private
    def all_variables
      @category = Category.new
      @categories = Category.all 
      @posts = Post.all
      @post = Post.new
    end
  
end
