Rails.application.routes.draw do
  root 'static_pages#root'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api do
    resources :users, only: [:show, :update]
  end
end
