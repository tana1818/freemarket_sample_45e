Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'products#index'
  resources :products, only: [:index, :new, :show, :create] do
    collection do
      get 'get_middle_categories'
      get 'get_small_categories'
      get 'judge_get_sizes'
      get 'judge_brand'
    end
  end

  resources :users, only: [:show, :new]
  resources :user_details, only: [:index]

end
