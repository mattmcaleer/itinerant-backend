Rails.application.routes.draw do
  resources :trips
  resources :cities
  resources :users

  post "/signup", to: "users#create"
  post "/signin", to: "sessions#create"
  get "/authorized", to: "sessions#show"
  get "/home", to: "users#show"  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
