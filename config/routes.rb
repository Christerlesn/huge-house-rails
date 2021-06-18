Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  
  get '/auth/:provider/callback', to: 'sessions#create'

  resources :reservations, only: [:new, :create, :show, :index, :edit, :update]


  resources :clients, only: [:new, :create, :show] do
    resources :reservations, only: [:index]
  end
  
  get '/client/most_active', to: 'clients#most_active'

  resources :vendors, only: [:new, :create, :index, :show]

  resources :events, only: [:new, :create, :index, :show] do
    resources :vendors, only: [:new, :create, :index, :show]
    resources :reservations, only: [:new, :create, :show, :index, :edit, :update]
  end
  
  delete '/reservations/:id' => 'reservations#destroy'
  delete '/vendors/:id' => 'vendors#destroy'
  delete '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
