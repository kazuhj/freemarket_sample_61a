Rails.application.routes.draw do
  root "tops#index"

  resources :tops, only: [:index]
  resources :item_sells, only: [:index]
  resources :item_informations, only: [:index]
  resources :users, only: [:index, :new] do
    collection do
      get :tel
      get :address
      get :credit
      get :done
      get :login
    end
  end
end
