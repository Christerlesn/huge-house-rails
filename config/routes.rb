Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  resources :clients, only: [:new, :create, :show]

  resources :reservations do
    resources :events, only: [:new, :create]
  end
  resources :vendors
  

  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
