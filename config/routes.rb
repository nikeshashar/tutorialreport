Rails.application.routes.draw do
  devise_for :users
  resources :sub_tutorials

  root to: "landing_page#index"
end
