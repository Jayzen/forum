Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'

  root 'welcomes#index'

  get 'signup', to: "users#new"
  get 'static_pages/home'
  get 'static_pages/help'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users do
    get 'topics', to: "users#topics"
    get 'details', to: "users#details"
    get 'replies', to: "users#replies"
    get 'collections', to: "users#collections"
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :edit, :create, :update]
  resources :topics
  post 'upload', to: 'topic_attaches#upload'
  
  namespace :admin do
    root "welcomes#index"
    post 'upload', to: 'topic_attaches#upload'
    resources :categories
    resources :users
    resources :topics do
      resources :topic_images, only: [:index, :create, :destroy, :update]
    end
  end
end
