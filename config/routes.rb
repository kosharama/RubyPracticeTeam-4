Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #get '/meets'
  get '/users', to:'users#index'
  get '/doctor/new', to: 'doctors#new', as: :new_doctor
  #get '/login', to: 'users#login', as: 'login'
  resources :users
  resources :doctors
  resources :meets
  # Defines the root path route ("/")
  root "doctors#index"
end
