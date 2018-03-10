Rails.application.routes.draw do
  devise_for :users
  resources :tutorials

  root to: "landing_page#index"
end
