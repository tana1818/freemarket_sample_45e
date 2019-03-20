Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
  }

  root 'products#index'
  resources :products, only: [:index, :new, :show, :create, :edit, :destroy] do
    resources :comments, only: [:create]
    collection do
      get 'search'
      get 'show_brand_item'
      get 'show_category_item'
      get 'purchase_confirmation'
      get 'get_middle_categories'
      get 'get_small_categories'
      get 'judge_get_sizes'
      get 'judge_brand'
    end
    member do
      get 'purchase_confirmation'
    end
  end

  resources :user_details, only: [:show]

  resources :users, only:[:show, :new, :create] do
    collection do
      get :signup
    end
    member do
      get :selling
      get :logout
      get :credit
      get :credit_create
      get :profile
    end
  end
end
