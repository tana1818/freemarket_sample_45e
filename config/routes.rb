Rails.application.routes.draw do
  root 'users#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  resources :users, only:[:edit, :show, :index]
  resources :gen
end
