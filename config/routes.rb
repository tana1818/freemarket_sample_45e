Rails.application.routes.draw do

  root 'products#index'
  resources :products, only: [:index, :show, :new]
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]

end
