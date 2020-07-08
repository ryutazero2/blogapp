Rails.application.routes.draw do
  root to: 'home#top'
  get 'about' , to: 'about#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'signup', to: 'users#new'

  post 'users/create', to: 'users#create'
end