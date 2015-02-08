Rails.application.routes.draw do
  root 'static_pages#root'
  get 'about', to: 'static_pages#about'

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]

  namespace :api do
    resources :users, only: [:show, :update]
    resources :images, only: [:create, :show, :index]
    resources :image_likes, only: [:create]
  end
end
