Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :ingredients

  root 'recipes#index'
end
