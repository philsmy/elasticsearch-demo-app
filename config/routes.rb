Rails.application.routes.draw do
  root 'purchase_orders#index'

  resources :order_items
  resources :items
  resources :purchase_orders
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
