Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
  resources :users
  resources :doctors
  resources :patients
  resources :appointments
  #resources :homes

  get 'homes/about'

end
