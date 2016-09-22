Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :settings, only: [:index]
  resources :players, only: [:new, :create, :edit, :update, :destroy]
  resources :courses, only: [:index, :show]
  resources :users, only: [:edit, :update]

  get 'courses/:id/tee_times', to: 'tee_times#index', as: 'tee_times'
  get 'courses/:course_id/tee_times/:id', to: 'tee_times#show', as: 'tee_time'

  resources :orders, only: [:index, :create]
  root to: "home#show"
end
