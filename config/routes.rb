Rails.application.routes.draw do
  resources :tutorials

  root to: "landing_page#index"
end
