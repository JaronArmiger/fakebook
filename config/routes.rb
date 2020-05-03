Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :users
  resources :posts
  resources :comments
  
  root 'static_pages#home'
  
end
