module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
      Product.class_eval do
        globalize_accessors :pl, :en
        scope :recent, order('products.created_at DESC')
        #named_scope :with_translations, :include => :translations
        default_scope :include => :translations
      end
      
      Taxon.class_eval do
        globalize_accessors :pl, :en
        #named_scope :with_translations, :include => :translations
        default_scope :include => :translations
      end
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end