class CardTypesController < ApplicationController
  before_action :authorize, only: [:new, :create, :edit, :update, :destroy, :show]


  def new
    # @page_title = 'Add Category'
    @cardType = CardType.new
  end

  def create
     @cardType = CardType.new(cardType_params)
     if @cardType.save
      flash[:notice] = 'Card Type created'
      redirect_to user_path(current_user)
     else 
      flash[:danger] = 'Card Type not created'
      render 'new'
     end
  end

  def edit
    @cardType = CardType.find(params[:id])
  end

  def update
    @cardType = CardType.find(params[:id])
    if @cardType.update(cardType_params)
      flash[:notice] = 'Card Type Updated'

      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def show
    @cardType = CardType.find(params[:id])
    @cardTypes = CardType.all 
    @cards = @cardType.cards
  end

  def destroy
    @cardType = CardType.find(params[:id])
    @cardType.destroy

    flash[:notice] = 'Card Type Removed'

    redirect_to user_path(current_user)
  end

  def index
    # if params[:search]
    #   @categories = Category.search(params[:search]).all.order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # else 
    @cardTypes = CardType.all
      # .order('created_at DESC').paginate(:per_page => 10, :page => params[:page])
    # end
  end

 

   private 
    def cardType_params
      params.require(:card_type).permit(:name, :user_id)
    end 
end
