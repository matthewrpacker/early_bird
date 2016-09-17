Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :settings, only: [:index]
  resources :players, only: [:new, :create]
  resources :courses, only: [:index, :show]
  get 'courses/:id/tee_times', to: 'tee_times#index', as: 'tee_times'
  resources :orders, only: [:index, :show]
  root to: "home#show"
end
