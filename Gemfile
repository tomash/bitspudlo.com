source 'http://rubygems.org'

gem 'rake', '~> 0.8.7'
gem 'rails', '3.1.10'
gem 'mysql2', '~> 0.3.6'

# gem 'thin'

# Deploy with Capistrano
gem 'capistrano'
gem 'capistrano-ext'

gem 'jquery-rails', '2.1.4'

# spree-related gems:
gem 'spree', '~> 0.70.7'
gem 'spree_core', :path => 'vendor/gems/spree_core-0.70.7'
gem 'paperclip', '~> 3.3.1'

gem 'deface', '~> 0.7.1'

gem "i18n"
gem "globalize3", :git => 'git://github.com/globalize/globalize.git', :ref => 'e4f33283bb68de68352eb22b7597e8f6cfce27f7'
gem "globalize_spree", :git => 'git://github.com/tomash/globalize-spree.git', :ref => '8fcf2af' 
#gem "globalize_spree", :path => "/home/tomek/rails_apps/spree_ext/globalize_spree"

gem "nokogiri"
gem "multi_currencies", :git => "git://github.com/pronix/spree-multi-currency.git", :ref => 'e17e5c'

gem "spree_paypal_website_standard", :git => "git://github.com/tomash/spree-pp-website-standard.git", :branch => 'version084'
#gem "spree_paypal_website_standard", :path => "/home/tomek/rails_apps/spree_ext/spree-pp-website-standard"

# spree templates and themes
gem 'spree_blue_theme', :git => 'git://github.com/spree/spree_blue_theme.git', :branch => '0-70-stable'
#gem 'spree_mobile_views', :git => 'git://github.com/romul/spree_mobile_views.git'

# spree analytics
gem 'spree_analytics', :path => "./vendor/spree_analytics"

group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

group :production do
  gem 'therubyracer'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl'
end

#gem "airbrake"
gem "airbrake", :git => "git://github.com/airbrake/airbrake.git"

