Rails.application.routes.draw do
  get 'menu/index'
  get 'home/index'
  get 'home/chart'
  resources :types
  resources :categories
  resources :markers

  root 'home#index'

  # ADD endpoint
  get '/categories/:id/endpoint', to: 'categories#endpoint', as: 'endpoint'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
