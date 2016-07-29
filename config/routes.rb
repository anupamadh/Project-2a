Rails.application.routes.draw do
  resources :products
  root 'sessions#new'
  # static pages routes, not connected to models
  get '/about', to: 'static_pages#about'

  # dynamic routes
  get '/signup', to: 'users#new'

  # login routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # restful routes
  resources :users, except: [:new]
  resources :reviews, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
