Rails.application.routes.draw do
<<<<<<< HEAD

  devise_for :users
  resources :users
  resources :products
  resources :user_details, only: [:index]

  # root 'under_constructions#index'
  root 'user_details#index'
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#show'
  resources :users, only: [:show]
  
>>>>>>> origin/gen
end
