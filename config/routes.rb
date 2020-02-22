Rails.application.routes.draw do
  root "tops#index"

  resources :tops, only: [:index]
  resources :item_sells, only: [:index]
  resources :item_informations, only: [:index]
  resources :item_buys, only: [:index] do
    collection do
      get 'done'
    end
  end
  resources :users, only: [:index, :new] do
    collection do
      get :tel
      get :address
      get :credit
      get :done
      get :login
    end
  end
  resources :mypages, only: [:index] do
    collection do
      get 'identification'
      get :profile
    end
  end
end