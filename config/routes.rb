Rails.application.routes.draw do
  
  
  root to: 'home#index'
  devise_for :users
  resources :venues
  resources :gigs
  resources :viewings
  resources :schedules
  resources :genres

end