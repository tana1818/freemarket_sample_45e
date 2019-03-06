Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]
  
end
