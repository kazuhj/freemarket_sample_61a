Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'telephones', to: 'users/registrations#new_telephone' # 電話番号を登録させるページを表示するアクション
  end
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