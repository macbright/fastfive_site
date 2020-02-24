class WebhookEventsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :whitelisted?
  # protect_from_forgery except: :create

  require 'net/http'

  def create

    if !WebhookEvent.find_by(ref: params[:data][:reference], external_id: params[:data][:id]).nil?
      render json: "Already processed #{params[:data][:id]}"
      return 200
    end
    @event = WebhookEvent.create(ref: params[:data][:reference], 
                        data: params[:data], state: 0, 
                        external_id: params[:data][:id])
    
    @result = params[:data][:status]
    @money = params[:data][:amount]
    @email = params[:data][:customer][:email]
    p "the returns params #{params[:data]}"
    case params[:event]
    when 'charge.success'
      # render status: 200
      #  Net::HTTPSuccess
      if @result == 'success'
        @user = User.find_by(email: @email)
        @user.wallet.fund_wallet(@money)
        @user.wallet.save
        return 200
      else 
        render json:  'Transaction failed'
      end
    else
      
    end
  end 

  private
    def whitelisted?
      ip = request.remote_ip
      return true if ['52.31.139.75', '52.49.173.169', '52.214.14.220'].include?(ip)
      false
    end
end
