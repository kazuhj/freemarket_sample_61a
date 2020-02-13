Rails.application.routes.draw do
  root "tops#index"

  resources :tops, only: [:index]
  resources :item_sells, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
