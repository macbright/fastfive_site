class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.wallet_id = current_user.wallet.id
    if @payment.save
      flash[:notice] = 'Wallet funded successfully'
      redirect_to user_path(current_user)
    else 
      render 'new'
    end
    
  end

  private
    def payment_params
        params.require(:payment).permit(:amount, :wallet_id, :token)
    end
end
