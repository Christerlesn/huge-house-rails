Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  
  resources :vendors
  resources :reservations
  resources :events
  resources :clients
  resources :sessions

  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
