Rails.application.routes.draw do
  root to: 'streamers#new'
  resources :streamers, only: [:index, :new, :create, :edit, :update, :destroy]
  get 'all_streamers', to: 'streamers#all_streamers'
  resources :videos, only: [:index, :create, :show, :edit, :update, :destroy]
  get 'new/:id', to: "videos#new", as: 'new_video'
  get 'videos/:streamer_id', to: "videos#show_videos_collection", as: 'show_videos_collection'
end
