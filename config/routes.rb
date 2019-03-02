Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'under_constructions#index'
  root 'users#show'
  resources :users, only: [:show]
end
