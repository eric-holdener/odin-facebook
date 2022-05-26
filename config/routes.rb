Rails.application.routes.draw do
  resources :reactions
  resources :comments
  resources :friendships, only: %i[create update destroy]
  resources :posts
  devise_for :users

  resources :profiles, only: %i[index show] do
    member do
      delete 'delete_image/:image_id', action: 'delete_image', as: 'delete_image'
    end
  end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "posts#index"
end
