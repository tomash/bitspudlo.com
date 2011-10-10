Taxon.class_eval do
  globalize_accessors :pl, :en
  #named_scope :with_translations, :include => :translations
  default_scope :include => :translations
end