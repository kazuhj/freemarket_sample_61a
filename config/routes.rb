Rails.application.routes.draw do
  root "tops#index"

  resources :tops, only: [:index]








  resources :item_sells, only: [:index]
end
