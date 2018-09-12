Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home"

  get "/signin", to: "sessions#new"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"

  resources :users

  resources :clients do
    resources :projects, only: [:index]
  end

  resources :projects do
    resources :entries, shallow: true
  end

end
