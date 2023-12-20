Rails.application.routes.draw do
  root to: 'streamers#new'
  resources :streamers, only: [:index, :new, :create]
  resources :videos, only: :index
end
