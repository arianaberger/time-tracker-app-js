Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "welcome#home"

  # get '/auth/facebook/callback' => 'sessions#create'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/dashboard' => 'users#show'

  resources :users

  resources :clients do
    resources :projects, only: [:index]
  end

  resources :projects do
    resources :entries, shallow: true
  end

end
