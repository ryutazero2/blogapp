Rails.application.routes.draw do
  root to: 'home#top'
  get 'about' , to: 'about#index'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  get 'users/:name', to: 'users#show'
  get 'users/:name/delete', to: 'users#delete'
  delete 'users/:name/destory' , to: 'users#destory'
  get 'users/:name/edit', to: 'users#edit'
  post 'users/:name/update', to: 'users#update'

  get 'newblog', to: 'posts#new'

end