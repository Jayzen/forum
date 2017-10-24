Rails.application.routes.draw do
  root 'welcomes#index'
  get 'password_resets/new'
  get 'password_resets/edit'

  get 'signup', to: "users#new"
  get 'static_pages/home'
  get 'static_pages/help'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users do
    member do
      get :following, :followers, :collections, :topics, :details, :replies 
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy] 
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :edit, :create, :update]
  resources :topics
  post 'upload', to: 'topic_attaches#upload'
  
  resources :categories
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
