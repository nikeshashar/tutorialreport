Rails.application.routes.draw do
  # devise_for :users
  # resources :tutorials
  get 'tutorials/:id', to: 'tutorials#show'

  root to: "landing_page#index"
end
