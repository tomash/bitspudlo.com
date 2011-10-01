class HomeController < Spree::BaseController
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  helper :taxons

  respond_to :html

  def index
  end

end
