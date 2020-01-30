Rails.application.routes.draw do
  root "tests#index"

  resources :tops, only: [:index]
  resources :items_sell, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
