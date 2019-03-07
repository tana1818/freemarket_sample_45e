Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root ‘products#index’
resources :products, only: [:index, :show, :new]
resources :user_details, only: [:index]
resources :users, only: [:show, :new] do
  collection do
    get :login
    get :logout
    get :credit
    get :credit_create
    get :signup
    get :signup_memberinfo
    get :signup_tel
    get :signup_address
    get :signup_credit
    get :signup_complete
  end
end
