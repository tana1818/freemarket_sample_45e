Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    # omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'products#index'
  resources :products, only: [:index, :show, :new] do
    collection do
      get :purchase_confirmation
    end
  end
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
end
