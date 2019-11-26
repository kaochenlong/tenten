Rails.application.routes.draw do
  devise_for :users

  resources :books, only: [:index, :show]

  root 'books#index'

  namespace :admin do
    root 'books#index'   # /admin/
    resources :books     # /admin/books
  end
end
