Rails.application.routes.draw do
  get '/signup' => 'users#new', as: 'signup'
  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'



  get 'rate' => 'rate#index'

  #get 'rate/select'

  #root to: 'rate#index'
  post '/rate/(:id)' => 'rate#select'
  get '/rate/(:id)' => 'rate#select'

  resources :values, only: [:new, :create]
  resources :images  do
    match :rate, via: :get, on: :member #-> url.com/images/:id/rate
  end
  resources :games
  resources :platforms
  resources :categories
  resources :users
  resources :relationships do
    match :follow, via: :get, on: :member
  end

  resources :sessions, only: [:new, :create, :destroy]

  root to: 'main#index'

  get 'main/help'

  get 'main/about'

  get 'main/contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
