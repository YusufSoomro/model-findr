Rails.application.routes.draw do
  root 'static_pages#root'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new]

  namespace :api do
    resources :users, only: [:create, :show, :update]
  end
end
