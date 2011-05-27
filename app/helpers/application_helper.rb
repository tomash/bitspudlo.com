module ApplicationHelper
  
  def currencied_number(amount)
    Currency.conversion_to_current(amount)
  end
  
  def logo(image_path=Spree::Config[:logo])
    link_to image_tag(image_path), root_path, :id => 'logo'
  end
end
