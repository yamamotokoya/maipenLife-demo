Rails.application.routes.draw do
  root to: 'streamers#new'
  resources :streamers, only: [:index, :new, :create, :edit, :update]
  get 'all_streamers', to: 'streamers#all_streamers'
  resources :videos, only: [:index, :create, :show, :edit, :update]
  get 'new/:id', to: "videos#new", as: 'new_video'
end
