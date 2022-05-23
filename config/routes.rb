Rails.application.routes.draw do
  
  resources :doctors, only: [:index, :create, :show, :destroy]
  resources :patients, only: [:index, :create, :show, :destroy]
  
  
  
  
  
  
  
  
  
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
