Rails.application.routes.draw do
  root 'welcome#index'

  get 'logout', to: 'sessions#destroy'

  resources :users
  resources :uploads
  resources :sessions, only: [:new, :create, :destroy]
end
