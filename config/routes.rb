Rails.application.routes.draw do
  resources :contact_informations
  resources :addresses
  resources :bookings
  resources :service_types
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
