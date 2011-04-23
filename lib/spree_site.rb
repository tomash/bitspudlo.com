module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
      Product.class_eval do
        globalize_accessors :pl, :en
      end
      
      Taxon.class_eval do
        globalize_accessors :pl, :en
      end
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end