Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'telephones', to: 'users/registrations#new_telephone' # 電話番号を登録させるページを表示するアクション
    post 'telephones', to: 'users/registrations#create_telephone' # 電話番号を登録するアクション
    get 'addresses', to: 'users/registrations#new_address' # 住所を登録させるページを表示するアクション
    post 'addresses', to: 'users/registrations#create_address' # 電話番号を登録するアクション
    get 'first_card_create', to: 'users/registrations#first_card_create' # クレジットカード情報の登録させるページを表示するアクション
    post 'first_card_create', to: 'users/registrations#first_card_create' # クレジットカードを登録するアクション
    get 'complete', to: 'users/registrations#complete' # 会員登録完了画面
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
  resources :users, only: [:listing, :in_progress, :completed], path: '/mypage/listings' do
    collection do
      get 'listing'
      get 'in_progress'
      get 'completed'
      get :purchased
    end
  end
  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update] do
  end
  resource :items, only: :confirmation, path: ":id" do
    collection do
      get 'confirmation'
      post 'confirmation', to: 'items#pay'
      get 'complete'
    end
  end
  resource :items, only: :show_mine, path: ":id" do
    collection do
      get 'show_mine'
      get 'item_stop'
      get 'item_state'
      get 'item_buy'
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

  resources :cards, only: [:new, :create, :show, :destroy] do
  end
end