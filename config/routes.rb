Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :settings, only: [:index]
  resources :players, only: [:new, :create]
  root to: "home#show"
end
