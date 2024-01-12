Rails.application.routes.draw do
  get 'secound_login/new'
  get 'secound_login/create'
  root to: 'streamers#index'
  resources :streamers, only: [:index, :new, :create, :show,:edit, :update, :destroy]
  get 'all_streamers', to: 'streamers#all_streamers'
  resources :videos, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :root_admin_users, only: [:new, :create]
  resources :first_login, only: [:new, :create]
  resources :secound_login, only: [:new, :create]
  get 'new/:id', to: "videos#new", as: 'new_video'
  post 'search', to: 'search#search'
end
