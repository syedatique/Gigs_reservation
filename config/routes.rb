Rails.application.routes.draw do
  
  # resources :homes, only: [:index]
  root to: 'home#index'
  devise_for :users
  resources :venues
  resources :gigs
  
  resources :schedules do 
    resources :bookings
  end
  resources :genres


end