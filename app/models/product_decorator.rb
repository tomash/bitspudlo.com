Product.class_eval do
  globalize_accessors :pl, :en
  scope :recent, order('products.created_at DESC')
  #named_scope :with_translations, :include => :translations
  default_scope :include => :translations
end