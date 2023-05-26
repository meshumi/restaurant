Rails.application.routes.draw do
  resources :restaurants do
    resources :menu_items
    resources :orders
  end
end
