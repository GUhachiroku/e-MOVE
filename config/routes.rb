Rails.application.routes.draw do
  root to: "toppages#index"
  
  #ユーザーの新規登録urlを/signupにするため、なくてもよい
  get "signup", to: "users#new"
  resources :users, only: [:index, :show, :new, :create]
end
