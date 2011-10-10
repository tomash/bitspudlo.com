Order.class_eval do
  def generate_order_number
    n = Time.now.to_i
    n = self.id if(self.id)
    self.number = n
    n
  end
end