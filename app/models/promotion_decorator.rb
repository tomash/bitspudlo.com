Promotion.class_eval do
  scope :advertised, includes(:stored_preferences).where("`preferences`.name = 'advertise' AND `preferences`.value = '1'")
end