module ApplicationHelper
  
  def currencied_number(amount)
    Currency.conversion_to_current(amount)
  end
end
