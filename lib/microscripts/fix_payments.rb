# fix paypal payments that have false total due to wrong currency setup
# temporary and only for orders/payments that were prior to system-wide bugfix

payments = Payment.where(:payment_method_id => 1).select{|p| p.order.payment_state == "credit_owed"}

payments.each do |payment|
  currency_paid = payment.order.payment_notifications.first.params["mc_currency"]
  gross_paid = payment.order.payment_notifications.first.params["mc_gross"]
  puts "order #{payment.order.number}:\t TOTAL #{payment.order.read_attribute(:total)} \t PAID #{gross_paid} #{currency_paid}"
  payment.amount = payment.order.read_attribute(:total)
  payment.save
  payment.order.update!
  puts "updated order #{payment.order.number}"
end
