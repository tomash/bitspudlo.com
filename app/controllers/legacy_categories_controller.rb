class LegacyCategoriesController < ApplicationController
  
  def show
    @category = Taxon.find(params[:id].to_i)
    redirect_to "/t/#{@category.permalink}", :status => 301
  end
end
