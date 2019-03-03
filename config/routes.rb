Rails.application.routes.draw do

  # resources :users
  # resources :products
  resources :user_details, only: [:index]

  # root 'under_constructions#index'
  root 'user_details#index'
end
