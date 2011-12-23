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

end