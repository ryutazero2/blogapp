Rails.application.routes.draw do
  root to: 'home#top'
  get 'about' , to: 'about#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'register', to: 'users#new'
  post 'register', to: 'users#create'

  resources :users, param: :name,  except: [:index,:create]
  get 'users/:name/delete_user', to: 'users#delete_user', as: :delete_user
  
  get 'blogs/new', to: 'posts#new'

end