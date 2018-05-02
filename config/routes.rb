Rails.application.routes.draw do
  get 'tutorials/:id', to: 'tutorials#show'

  root to: "landing_page#index"

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]
end
