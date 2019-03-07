Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'users#show'
  # resources :users, only: [:show]
  # root 'users#show'
  # resources :users, only: [:show, :new]
  # resources :user_details, only: [:index]
  root 'products#index'
  resources :products, only: [:index, :show, :new]
  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]
  get  '/users/new' => 'users#new'
  get  '/users/show' => 'users#show'
  get  '/users/login' => 'users#login'
  get  '/users/logout' => 'users#logout'
  get  '/users/credit' => 'users#credit'
  get  '/users/credit_create' => 'users#credit_create'
  get  '/users/signup' => 'users#signup'
  get  '/users/signup_memberinfo' => 'users#signup_memberinfo'
  get  '/users/signup_tel' => 'users#signup_tel'
  get  '/users/signup_address' => 'users#signup_address'
  get  '/users/signup_credit' => 'users#signup_credit'
  get  '/users/signup_complete' => 'users#signup_complete'
end
