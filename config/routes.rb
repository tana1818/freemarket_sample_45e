Rails.application.routes.draw do

  root 'users#show'
  resources :products, onry: [:show]
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]

end
