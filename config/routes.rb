Rails.application.routes.draw do
  root to: 'products#index' # or your main controller and action

  get 'signup', to: 'users#new', as: 'signup'
  resources :users, only: [:create]

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  

  get 'about', to: 'about#index', as: 'about_us'

  namespace :admin do
    root to: 'dashboard#show'
    resources :products, except: [:edit, :update, :show]
    resources :categories, only: [:index, :new, :create]
  end

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post :add_item
    post :remove_item
  end

  resources :orders, only: [:create, :show]

  # Remove unnecessary routes
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'
end
