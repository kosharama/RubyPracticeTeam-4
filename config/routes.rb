Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get '/meets'
  get '/users', to:'users#index'
  get '/doctor/new', to: 'doctors#new', as: :new_doctor
  get 'user', to: 'users#show'

  get '/users/sign_in', to: 'users#sign_in'
  post '/users/login', to: 'users#login', as: :login

  get '/users/sign_up', to: 'users#sign_up'
  post '/users/register', to: 'users#create', as: :register

  get '/meets/new', to: 'meets#new', as: :new_meet

  #get '/login', to: 'users#sign_in'
  #post '/login', to: 'users#sign_in'

  resources :users
  resources :doctors
  resources :meets
  # Defines the root path route ("/")
  root "doctors#index"
end
