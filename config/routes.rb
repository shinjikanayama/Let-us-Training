Rails.application.routes.draw do

  root to: "homes#top"
  # ゲストユーザー
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'

  get 'about' => 'homes#about'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :users, only: [:show, :edit, :update]
  resources :genres, only: [:index, :edit, :create, :update, :destroy]
  resources :posts do
    resources :comments, only: [:create, :destroy]
    get 'log', on: :collection
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

