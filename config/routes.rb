Rails.application.routes.draw do
  root "items#index"

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
  resources :items, only: [:index, :new, :show] do
    collection do
      get 'confirmation'
      get 'complete'
    end
  end
  resources :mypages, only: [:index] do
    collection do
      get 'identification'
      get :profile
      get :card
      get :card_create
      get :logout
    end
  end
end