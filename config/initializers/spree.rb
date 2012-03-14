APP_CONFIG = YAML.load(File.read(File.join(Rails.root, "config", "application.yml")))

# validations
Spree::Config.set(:address_requires_state => true)

Spree::Paypal::Config.set({
  :account => APP_CONFIG["paypal"]["account"], 
  :success_url => APP_CONFIG["paypal"]["success_url"],
  :currency_code => "PLN", 
  :sandbox_url => APP_CONFIG["paypal"]["sandbox_url"],
  :paypal_url => APP_CONFIG["paypal"]["paypal_url"],
  :encryption => APP_CONFIG["paypal"]["encryption"],
  :cert_id    => APP_CONFIG["paypal"]["cert_id"],
  :ipn_secret => APP_CONFIG["paypal"]["ipn_secret"]
})

Spree::Paypal::Config.set(:populate_address => true)

# no SSL please
Spree::Config.set(:allow_ssl_in_production => false)

# client-side
Spree::Config.set(:products_per_page => 24)

# admin
Spree::Config.set(:orders_per_page => 20)
Spree::Config.set(:admin_products_per_page => 20)

# inventory-related stuff
Spree::Config.set(:allow_backorders => false)

I18n.locale = :en


# other config options
ActionMailer::Base.default_url_options[:host] = APP_CONFIG["host"]
