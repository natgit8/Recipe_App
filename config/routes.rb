Rails.application.routes.draw do
  # devise_for :users
  resources :recipes do
    resources :comments
  end
  
  resources :ingredients

  root 'recipes#index'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

end
