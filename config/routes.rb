Rails.application.routes.draw do
  devise_for :users

  post 'authenticate', to: 'authentication#authenticate'
  # post '/auth/signup', to:'users#create'

  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
