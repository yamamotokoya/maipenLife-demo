Rails.application.routes.draw do
  get 'secound_login/new'
  get 'secound_login/create'
  root to: 'login#new'
  resources :streamers, only: [:index, :new, :create, :show,:edit, :update, :destroy]
  get 'all_streamers', to: 'streamers#all_streamers'
  get 'all_videos', to: 'videos#all_videos'
  resources :videos, only: [:index, :create, :show, :edit, :update, :destroy]
  resources :genres, only: [:index, :show, :new, :create, :destroy]
  get 'index/admin', to: 'genres#index_for_admin', as: 'genres_admin'
  get 'show/:id/admin', to: 'genres#show_for_admin', as: 'genre_admin'
  resources :root_admin_users, only: [:index,:new, :create, :destroy]
  resources :login, only: [:new, :create]
  delete "logout", to: "login#destroy", as: "logout"
  resources :secound_login, only: [:new, :create]
  resources :admin_users
  get 'menu', to: 'menu#index', as: 'menu'
  post 'likes', to: "likes#create"
  delete 'likes/:id', to: "likes#destroy"
  get 'new/:id', to: "videos#new", as: 'new_video'
  post 'search', to: 'search#search'
  get 'return_streamers_videos/:id', to: "api#return_streamers_videos"
  get 'return_videos', to: "api#return_videos"
  post 'return_search_result', to: "api#return_search_result"
end
