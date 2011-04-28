APP_CONFIG = YAML.load(File.read(File.join(RAILS_ROOT, "config", "application.yml")))

# validations
Spree::Config.set(:address_requires_state => false)

Spree::Paypal::Config.set({
  :account => APP_CONFIG["paypal"]["account"], 
  :ipn_notify_host => APP_CONFIG["paypal"]["ipn_notify_host"],
  :success_url => APP_CONFIG["paypal"]["success_url"],
  :currency_code => "EUR", 
  :sandbox_url => APP_CONFIG["paypal"]["sandbox_url"],
  :paypal_url => APP_CONFIG["paypal"]["paypal_url"],
})

Spree::Paypal::Config.set(:populate_address => true)

# no SSL please
Spree::Config.set(:allow_ssl_in_production => false)

# 
Spree::Config.set(:products_per_page => 24)
Spree::Config.set(:allow_backorders => false)

I18n.locale = :en
