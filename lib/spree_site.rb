require 'spree_site_hooks'

module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      # Add your custom site logic here
      Order.class_eval do
        def generate_order_number
          n = Time.now.to_i
          n = self.id if(self.id)
          self.number = n
          n
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
      end
      
      
      ActiveSupport::Notifications.subscribe('spree.order.contents_changed') do |*args|
        event = ActiveSupport::Notifications::Event.new(*args)
        order = event.payload[:order]
        order.line_items.each do |line_item|
          if((order.state == "cart") && (line_item.quantity > line_item.variant.on_hand))
            line_item.update_attribute(:quantity, line_item.variant.on_hand)
            #order.update_totals && order.save
            order.reload.update!
          end
        end
      end
      
      Spree::BaseController.class_eval do
        def set_currency_to_pln
          logger.info "Spree::BaseController#set_currency_to_pln called"
          @currency = Currency.find_by_char_code("PLN")
          session[:currency_id] = :PLN
          Currency.current!(@currency)
        end
      end
      
      PaymentNotificationsController.class_eval do
        before_filter :set_currency_to_pln
      end
      
      Admin::BaseController.class_eval do
        before_filter :set_currency_to_pln
      end
      
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end
