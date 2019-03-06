Rails.application.routes.draw do

  root 'under_constructions#index'
  resources :products, onry: [:show, :new]
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]

end
