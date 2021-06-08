Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  # get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/github/callback' => 'sessions#omniauth'

  resources :reservations
  resources :clients, only: [:new, :create, :show] do
    resources :reservations, only: [:index]
  end
  
  resources :vendors

  resources :events do
    resources :vendors
  end
  

  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
