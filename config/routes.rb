Rails.application.routes.draw do
  resources :values
  resources :images
  resources :games
  resources :platforms
  resources :categories
  resources :users
  root 'main#index'

  get 'main/index'

  get 'main/help'

  get 'main/about'

  get 'main/contacts'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
