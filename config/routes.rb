Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friend_requests, only: [:index, :create]
  get '/home', to: 'static_pages#home'
  
  root 'static_pages#home'
  
end
