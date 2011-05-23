class LegacyProductsController < ApplicationController
  
  def show
    @product = Product.find(params[:id].to_i)
    redirect_to product_path(@product), :status => 301
  end
end
