Admin::OverviewController.class_eval do

  private
  def best_selling_variants
    #li = LineItem.includes(:order).where("orders.state = 'complete'").sum(:quantity, :group => :variant_id, :limit => 5)
    li = LineItem.includes(:order).where("orders.state = 'complete'").order("SUM(line_items.quantity) DESC").sum(:quantity, :group => :variant_id, :limit => 5)
    variants = li.map do |v|
      variant = Variant.find(v[0])
      [variant.name, v[1] ]
    end
    variants.sort { |x,y| y[1] <=> x[1] }
  end

  def top_grossing_variants
    total_sold_prices = LineItem.includes(:order).where("orders.state = 'complete'").order("SUM(line_items.quantity * line_items.price) DESC").sum("price * quantity", :group => :variant_id, :limit => 5)
    variants = total_sold_prices.map do |v|
      variant = Variant.find(v[0])
      [variant.name, v[1]]
    end

    variants.sort { |x,y| y[1] <=> x[1] }
  end
end
