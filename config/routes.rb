Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :profiles

  # Defines the root path route ("/")
  root "profiles#new"
end
