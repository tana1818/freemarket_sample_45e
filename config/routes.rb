Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get  '/users/show' => 'users#show'
  get  '/users/login' => 'users#login'
  get  '/users/logout' => 'users#logout'
  get  '/users/credit' => 'users#credit'
  get  '/users/credit_create' => 'users#credit_create'
  get  '/users/signup' => 'users#signup'
  get  '/users/signup_memberinfo' => 'users#signup_memberinfo'
  get  '/users/signup_tel' => 'users#signup_tel'
  get  '/users/signup_address' => 'users#signup_address'
  get  '/users/signup_pay' => 'users#signup_pay'
  get  '/users/signup_complete' => 'users#signup_complete'
end
