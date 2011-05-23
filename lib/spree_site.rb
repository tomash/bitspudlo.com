module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
      Order.class_eval do
        def generate_order_number
          self.number = self.id
        end
      end
      
      Product.class_eval do
        globalize_accessors :pl, :en
        scope :recent, order('products.created_at DESC')
        #named_scope :with_translations, :include => :translations
        default_scope :include => :translations
      end
      
      Promotion.class_eval do
        scope :advertised, includes(:stored_preferences).where("`preferences`.name = 'advertise' AND `preferences`.value = '1'")
      end
      
      Taxon.class_eval do
        globalize_accessors :pl, :en
        #named_scope :with_translations, :include => :translations
        default_scope :include => :translations
        
        # Creates permalink based on .to_url method provided by stringx gem
        def set_permalink
          if parent_id.nil?
            self.permalink = name.to_url if self.permalink.blank?
          else
            self.permalink = "#{t.root.permalink}/#{t.id}-#{t.name.to_url}"
          end
        end
      end
      
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end