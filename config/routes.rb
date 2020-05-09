Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users
  resources :posts
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friend_requests, only: [:index, :create, :destroy]
  
  get    '/home',        to: 'static_pages#home'
  post   '/friendships', to: 'friendships#create'
  delete '/friendships', to: 'friendships#destroy'
  
  root 'static_pages#home'
  
end
