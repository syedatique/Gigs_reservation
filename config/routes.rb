Rails.application.routes.draw do
  
  devise_for :users
  root to: 'home#index'

  # resources :schedules
  resources :venues
  resources :genres
  resources :gigs
  
  resources :viewings

end