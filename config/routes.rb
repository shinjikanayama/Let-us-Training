Rails.application.routes.draw do
  root to: "homes#top"
  get 'about' => 'homes#about'
  devise_for :users

  resources :users, only: [:show, :edit]
  resources :users, only: [:index, :edit]
  resources :posts

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


end

