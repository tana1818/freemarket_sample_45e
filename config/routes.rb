Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'users#login'
  get  '/users' => 'users#login'
  get  '/users/logout' => 'users#logout'
  get  '/users/show' => 'users#show'
  get  '/users/credit' => 'users#credit'
  get  '/users/creditcreate' => 'users#creditcreate'

end
