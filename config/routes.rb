Rails.application.routes.draw do

  root "welcome#home"

  # get '/auth/facebook/callback' => 'sessions#create'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy"

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/dashboard' => 'users#show', as: 'dashboard'

  post '/projects' => 'projects#create'


#I don't want any extra :user routes here!
  resources :users, only: [:index, :create, :show] do 
    resources :projects, shallow: true
  end

  resources :clients do
    resources :projects, shallow: true
  end

end
