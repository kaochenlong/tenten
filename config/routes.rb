Rails.application.routes.draw do
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks' 
  }

  resources :books, only: [:index, :show] do
    member do
      post :comment
    end
  end
  resources :publishers, only: [:show]

  root 'books#index'

  namespace :admin do
    root 'books#index' 
    resources :books
    resources :publishers, except: [:show]
    resources :categories, except: [:show]
  end
end
