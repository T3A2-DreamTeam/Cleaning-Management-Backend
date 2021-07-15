Rails.application.routes.draw do
  resources :users
  resources :contact_informations
  resources :addresses
  resources :bookings, only: [:index, :create, :destroy]
  resources :service_types, only: [:index]

  post "/signup", to: "users#signup"
  post "/login", to: "users#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
