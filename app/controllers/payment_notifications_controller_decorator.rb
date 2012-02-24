PaymentNotificationsController.class_eval do
  before_filter :set_currency_to_pln
  before_filter :return_for_inexisting_orders

  private
  def return_for_inexisting_orders
    @order = Order.find_by_number(params[:invoice])
    if(@order.nil? || params[:invoice].nil?)
      render :text => 'not found', :status => 200, :layout => false
    end
  end
end