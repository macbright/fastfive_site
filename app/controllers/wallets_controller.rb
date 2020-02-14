class WalletsController < ApplicationController
  def new
    @wallet = Wallet.new
  end
  
  def create
     @wallet = Wallet.new(wallet_params)
     if @wallet.save
      flash[:notice] = 'Wallet created successfully'
      redirect_to user_path(current_user)
     else 
      render 'new'
     end
  end

  private 
    def wallet_params
      params.require(:wallet).permit(:user_id, :balance)
    end
end
