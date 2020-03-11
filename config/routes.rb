Rails.application.routes.draw do
  devise_for :users
  root "items#index"

  resources :users, only: [:index, :new] do
    collection do
      get :tel
      get :address
      get :credit
      get :done
      get :login
    end
  end
  resources :users, only: [:listing, :in_progress, :completed], path: '/mypage/listings' do
    collection do
      get 'listing'
      get 'in_progress'
      get 'completed'
    end
  end
  resources :items, only: [:index, :new, :create, :show, :update] do
    collection do
      get 'confirmation'
      get 'complete'
      get 'item_stop'
    end
  end
  resource :items, only: :show_mine, path: "m:id" do
    collection do
      get 'show_mine'
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