class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def set_currency_to_pln
    logger.info "ApplicationController#set_currency_to_pln called"
    @currency = Currency.find_by_char_code("PLN")
    session[:currency_id] = :PLN
    Currency.current!(@currency)
  end
end
