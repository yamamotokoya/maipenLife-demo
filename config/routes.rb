Rails.application.routes.draw do
  get 'secound_login/new'
  get 'secound_login/create'
  root to: 'streamers#index'
  resources :streamers, only: [:index, :new, :create, :show,:edit, :update, :destroy]
  get 'all_streamers', to: 'streamers#all_streamers'
  resources :videos, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :root_admin_users, only: [:index,:new, :create, :destroy]
  resources :first_login, only: [:new, :create]
  resources :secound_login, only: [:new, :create]
  resources :admin_users
  get 'new/:id', to: "videos#new", as: 'new_video'
  post 'search', to: 'search#search'
  get 'return_streamers_videos/:id', to: "api#return_streamers_videos"
  get 'return_videos', to: "api#return_videos"
  post 'return_search_result', to: "api#return_search_result"
end
