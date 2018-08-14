Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :books, only: [:show]
  
  get 'categories/all', to: 'categories#show_all'
  resources :categories, only: [:show]
end
