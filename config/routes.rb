Bitspudlo50::Application.routes.draw do

  root :to => 'home#index'

  namespace :admin do
    resources :timetrackings
  end

  # gracefully handling legacy URLs
  #match ':locale/products/:id' => 'legacy_products#show'
  match '/en/products/:id' => 'legacy_products#show'
  match '/pl/products/:id' => 'legacy_products#show'
  
  #match ':locale/categories/:id' => 'legacy_categories#show'
  match '/en/categories/:id' => 'legacy_categories#show'
  match '/pl/categories/:id' => 'legacy_categories#show'
  match '/categories/:id' => 'legacy_categories#show'
  
  match '/store/view_order/:id/:token' => 'legacy_orders#show'
  match ':locale/store/view_order/:id/:token' => 'legacy_orders#show'
end
