Rails.application.routes.draw do
  root 'posts#index'
  resources :users, only: [:new, :create]
  resources :posts
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new' # Use 'new' instead of 'create'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  post '/posts/:id', to: 'posts#update', as: 'update_post'
  get '/updated', to: 'posts#index_updated'
  get '/posts/:id/indexupvote', to: 'posts#indexupvote'
  get '/posts/:id/indexdownvote', to: 'posts#indexdownvote'
  get '/posts/:id/upvote', to: 'posts#upvote', as: 'upvote_post'


  resources :posts do
    resources :comments, only: [:create]
  end

  resources :posts do
    member do
      post 'upvote'
      post 'downvote'
      post 'indexupvote'
      post 'indexdownvote'
    end
  end
end
