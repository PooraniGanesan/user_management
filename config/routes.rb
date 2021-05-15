Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  get 'sessions/create'
  get 'sessions/login'
  resources :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
