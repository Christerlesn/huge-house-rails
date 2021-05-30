Rails.application.routes.draw do
  resources :vendors
  resources :reservations
  resources :events
  resources :clients
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
