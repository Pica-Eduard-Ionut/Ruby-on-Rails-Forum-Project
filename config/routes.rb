Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "categories#index"
  resources :categories do
    resources :posts, only: [:new, :create]
  end
  delete 'posts/:id', to: 'posts#destroy', as: 'post'


  
  
  resources :posts do
    resources :comments
  end
  
end
