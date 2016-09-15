Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :settings, only: [:index]
  resources :players, only: [:new, :create]
  resources :tee_times, only: [:index]
  resources :courses, only: [:index]
  resources :orders, only: [:index, :show]
  root to: "home#show"
end
