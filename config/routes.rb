Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/team'
  get 'static_pages/contact'
  get 'static_pages/welcome'
  get '/team', to: 'static_pages#team' 
  get '/contact', to: 'static_pages#contact'
  get '/home', to: 'static_pages#home'
  get '/welcome', to: 'static_pages#welcome'
  

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
