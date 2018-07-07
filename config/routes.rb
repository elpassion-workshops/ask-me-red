Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
  resources :users, only: [:show]
  root to: 'home#index'
  resources :home, only: :index
  resources :questions
end
