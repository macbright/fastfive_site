class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :avatar])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :avatar])
  end

  def currency_to_number(currency)
    price = currency.to_s.gsub(/[N,]/,'').to_i
    p ("this is amount #{price}")
    return price
  end

  

  def authorize
    redirect_to root_path, alert:"Not authorized" if current_user.try(:admin) == false
  end


end
