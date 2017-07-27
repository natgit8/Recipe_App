Rails.application.routes.draw do
  resources :recipes
  resources :ingredients

  root 'recipes#index'
end
