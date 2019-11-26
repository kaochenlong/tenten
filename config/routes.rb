Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :show]

  root 'books#index'

  namespace :admin do
    root 'books#index' 
    resources :books
    resources :publishers, except: [:show]
  end
end
