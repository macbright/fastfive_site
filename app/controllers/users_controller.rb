class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_variables
  

  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.all
    @users = User.where('id != ?', current_user.id)
    @cardTypes = CardType.all 
  end

  def index
    
    # render :json => User.all
  end

  private
    def all_variables
      @category = Category.new
      @categories = Category.all 
      @posts = Post.all
      @post = Post.new
      @cardTypes = CardType.all 
      @soldCards = Card.where(cardStatus: true)
      @unsoldCards = Card.where(cardStatus: false)
      @purchasedCards = Card.where(cardStatus: true, customer_id: current_user.id)
      @cards = Card.all
    end
end
