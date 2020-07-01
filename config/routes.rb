Rails.application.routes.draw do
  get '/' => "home#top"
  get 'about' => "about#index"
  get 'signup' => "users#new"
  post "users/create" => "users#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
