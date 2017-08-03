Rails.application.routes.draw do
  # devise_for :users
  resources :recipes
  resources :ingredients

  root 'recipes#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

end
