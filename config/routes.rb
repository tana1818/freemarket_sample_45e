Rails.application.routes.draw do
  # root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  resources :users
  resources :gen
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'under_constructions#index'
end
