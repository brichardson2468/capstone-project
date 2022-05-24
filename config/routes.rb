Rails.application.routes.draw do
  
  resources :appointments, only: [:index, :create, :show, :destroy]
  resources :scores, only: [:index, :create, :show, :destroy]
  resources :patients, only: [:index, :create, :show, :destroy]
  resources :doctors, only: [:index, :create, :show, :destroy]

  post '/login', to: "sessions#create"

  delete '/logout', to: "sessions#destroy"

  get '/auth', to: "doctors#show"

  get '/signup', to: "doctors#create"

  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
