Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'under_constructions#index'
  resources :products, only: [:new]
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]

end
