Rails.application.routes.draw do
  root 'welcomes#index'

  get 'signup', to: "users#new"
  get 'static_pages/home'
  get 'static_pages/help'
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :users
end
