Bitspudlo50::Application.routes.draw do

  match ':locale/products/:id' => 'legacy_products#show'
  
  match ':locale/categories/:id' => 'legacy_categories#show'
  match '/categories/:id' => 'legacy_categories#show'
end
