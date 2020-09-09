Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  get 'items', to: 'items#new'
  post 'items', to: 'items#create'
  resources :items
end