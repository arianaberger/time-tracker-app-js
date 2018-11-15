Rails.application.routes.draw do

  root "welcome#home"

  get '/auth/facebook/callback' => 'sessions#create'

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  post "/logout", to: "sessions#destroy", as: '/logout'

  get '/signup' => 'users#new', as: 'signup'
  post '/signup' => 'users#create'
  get '/dashboard' => 'users#index', as: 'dashboard'

  post '/projects' => 'projects#create'

  resources :entries
  resources :projects

  resources :users, only: [:index, :create, :show] do 
    resources :projects
  end

  resources :users, only: [:index, :create, :show] do 
    resources :entries
  end


end
 