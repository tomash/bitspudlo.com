class LegacyOrdersController < ApplicationController
  
  def show
    redirect_to "http://old.bitspudlo.com#{request.fullpath}"
  end
end
