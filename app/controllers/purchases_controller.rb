class PurchasesController < ApplicationController
before_action :authorize, only: [ :destroy]
  def new
    @purchase = Purchase.new
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @card = Card.find_by(id: params[:id])
    @unsoldCards = Card.where(cardStatus: false, customer_id: 0)
    if @unsoldCards.length > 0
      if @purchase.save
        @card = Card.find(@purchase.card_id)
        @unsoldCards = Card.where(cardStatus: false, customer_id: 0, name: @card.name)
        if @unsoldCards.length > 0
          @bought_card = @unsoldCards[0]
          @cardPrice = currency_to_number(@bought_card.cardPrice)
          if current_user.wallet.balance >= @cardPrice
            @bought_card = @unsoldCards[0]
            @cardPrice = currency_to_number(@bought_card.cardPrice)
            @bought_card.cardStatus = true
            @bought_card.customer_id = current_user.id
            @bought_card.save
            current_user.wallet.balance -= @cardPrice
            current_user.wallet.save
            redirect_to user_path(current_user)
          else 
            flash[:danger] = "You have an insufficient balance to make this purchase.
            You need to fund ur wallet in order to make this purchase. 
            Click on fund wallet to fund your wallet"
            @purchase.destroy
            redirect_to user_path(current_user)
          end 
        else 
          flash[:danger] = "The selected card is currently out of stock please contact 
          admin to rectify the issue"
          redirect_to user_path(current_user)
        end
      else
        render 'new'
      end
    else  
      flash[:notice] = "The selected card is out of stock please contact admin"
      redirect_to user_path(current_user)
    end
    
  end

  private 
    def purchase_params
      params.require(:purchase).permit(:user_id, :card_id, :quantity)
    end
  
end
