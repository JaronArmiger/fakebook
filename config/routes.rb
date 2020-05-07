Rails.application.routes.draw do
  get 'friend_requests/create'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  get '/home', to: 'static_pages#home'
  
  root 'static_pages#home'
  
end
