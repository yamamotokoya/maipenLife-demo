Rails.application.routes.draw do
  root to: 'streamers#index'
  resources :streamers, only: [:index, :new, :create, :show,:edit, :update, :destroy]
  get 'all_streamers', to: 'streamers#all_streamers'
  resources :videos, only: [:index, :create, :show, :edit, :update, :destroy]
  get 'new/:id', to: "videos#new", as: 'new_video'
end
