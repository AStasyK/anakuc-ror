Rails.application.routes.draw do
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  get 'rate' => 'rate#index'

  get 'rate/select'

  #root to: 'rate#index'
  get '/rate/(:id)' => 'rate#select'

  resources :values
  resources :images
  resources :games
  resources :platforms
  resources :categories
  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'main#index'

  get 'main/help'

  get 'main/about'

  get 'main/contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
