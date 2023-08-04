# Frozen_string_literal: true

Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/stop_bid/(:id)', to: 'bids#stop_bid'
  get '/show_bid/(:id)', to: 'bids#show_bid'
  get '/show_all_bid/', to: 'bids#show_all_bid'
  resources :users
  resources :products
  resources :bids
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
