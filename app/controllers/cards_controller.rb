class CardsController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy, :show]

  def new
    # @page_title = 'Add Category'
    @card = Card.new
  end

  def create
     @card = Card.new(card_params)
    if @card.save
      flash[:notice] = 'Card Type created'
      redirect_to user_path(current_user)
     else 
      flash[:danger] = 'Card Type not created'
      render 'new'
     end
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      flash[:notice] = 'Card  Updated'

      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @card = Card.find(params[:id])
    @cardS = Card.all 
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy

    flash[:notice] = 'Card Type Removed'

    redirect_to user_path(current_user)
  end

  def index
    # if params[:search]
    #   @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # else 
    @card = Card.all
      # .order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # end
  end

 

  private 
    def card_params
      params.require(:card).permit(:cardKind, :name, :user_id, :cardPin, :cardSerialNum, :cardPrice, :customer_id)
    end 
end
