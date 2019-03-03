Rails.application.routes.draw do

  resources :users
  resources :products
  
  root 'under_constructions#index'
end
