Rails.application.routes.draw do
  root 'welcome#index'

  resources :users
  resources :uploads
  resources :sessions
end
