Rails.application.routes.draw do
  root 'streamers#new'
  resources :streamers, only: [:index, :new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end