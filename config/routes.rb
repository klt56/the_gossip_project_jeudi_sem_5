Rails.application.routes.draw do
  get 'users/new'
  get 'static_pages/home'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome'
  get '/team', to: 'static_pages#team' 
  get '/contact', to: 'static_pages#contact'
  get '/home', to: 'static_pages#home'
  get '/welcome', to: 'static_pages#welcome'
  root "gossips#index"
  resources :gossips 

resources :posts do
  resources :comments, only: [:create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
resources :likes, only: [:create, :destroy]


resources :users, only: [:create]

get '/sign_in', to: 'sessions#new'
get '/sign_out', to: 'sessions#destroy'
resource :sessions, only: [:create, :show, :destroy, :new]
end