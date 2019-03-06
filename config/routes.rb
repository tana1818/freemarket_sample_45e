Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :products
  resources :user_details, only: [:index]

  # root 'under_constructions#index'
  root 'user_details#index'

end
