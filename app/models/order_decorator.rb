Order.class_eval do
  def generate_order_number
    record = true
    while record
      random = Time.now.to_i + rand(30)
      record = self.class.find(:first, :conditions => ["number = ?", random])
    end
    self.number = random if self.number.blank?
    self.number
  end

  def self.find_by_param(param)
    Order.where(:number => param).first || Order.find(param)
  end

  # TODO: change in spree-pp-website-standard instead of here
  def paypal_encrypted(payment_notifications_url, options = {})
    values = {
      :business => Spree::Paypal::Config[:account],
      :invoice => self.number,
      :cmd => '_cart',
      :upload => 1,
      :currency_code => options[:currency_code] || Spree::Paypal::Config[:currency_code],
      :handling_cart => self.ship_total,
      :return => Spree::Paypal::Config[:success_url],
      :notify_url => payment_notifications_url,
      :charset => "utf-8",
      :cert_id => Spree::Paypal::Config[:cert_id],
      :page_style => Spree::Paypal::Config[:page_style],
      :tax_cart => self.tax_total,
      :lc => 'en'
    }

    self.line_items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index + 1}" => item.price,
        "item_name_#{index + 1}" => item.variant.product.name,
        "item_number_#{index + 1}" => item.variant.product.id,
        "quantity_#{index + 1}" => item.quantity
      })
    end
    
    encrypt_for_paypal(values)
  end

end