Rails.application.routes.draw do

  root to: "homes#top"
  # ゲストユーザー
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  get 'about' => 'homes#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  #検索のため
  post '/search',  to: 'posts#search'
  get  '/search',  to: 'posts#search'

  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :likes
    end
    resource :follows, only: [:create, :destroy]
    get 'followings' => 'follows#followings', as: 'followings'
    get 'followers' => 'follows#followers', as: 'followers'
  end
  resources :genres, only: [:index, :edit, :create, :update, :destroy]

  resources :posts do
  resources :comments, only: [:create, :destroy]
  resource :likes, only: [:create, :destroy] # 単数形の`resource`にする
  get 'log', on: :collection
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

