Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  resources :books, only: [:index, :show]
  resources :publishers, only: [:show]
  resources :comments, only: [:create]

  root 'books#index'

  namespace :admin do
    root 'books#index' 
    resources :books
    resources :publishers, except: [:show]
  end
end
