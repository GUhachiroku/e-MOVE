Rails.application.routes.draw do
  devise_for :users
  root to: "microposts#index"
  
  #した三つはログイン機能
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #サインアップぺージのurlを/signupにするため。なくてもよい
  get "signup", to: "users#new"

 
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  resources :microposts, only: [:index, :new, :create, :edit, :update, :destroy]
  resources :inquiries, only: [:new, :create]
  resources :rooms, only: [:index, :show]
end
