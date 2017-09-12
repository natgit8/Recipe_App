Rails.application.routes.draw do
  # devise_for :users
  resources :recipes do
    resources :comments
    resources :favorites, only: :create
  end
  resources :ingredients
  get '/testing', to: 'recipes#testing'
  root 'recipes#index'

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
end
