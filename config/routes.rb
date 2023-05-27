Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: [:new, :create]
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new' # Use 'new' instead of 'create'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :posts do
    resources :comments, only: [:create]
  end
end
