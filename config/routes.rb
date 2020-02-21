Rails.application.routes.draw do
  root to: "toppages#index"
  
  #した三つはログイン機能
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  
  #サインアップぺージのurlを/signupにするため。なくてもよい
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create]
end
