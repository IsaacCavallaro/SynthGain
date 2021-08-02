Rails.application.routes.draw do
  get 'users_info/index', to: 'users_info#index', as: 'users_info'
  get 'users_info/show'
  get 'users_info/create'
  post 'users_info/create', to: 'users_info#create', as: 'users_info_create_post'
  get 'users_info/edit'
  get 'users_info/destroy'
  get 'users_info/new/:id', to: 'users_info#new', as: 'users_info_new'
  get 'payments/webhook'
  devise_for :users
  root to: 'pages#home'
  get 'pages/about', to: 'pages#about'
  devise_for :installs
  resources :listings
  post '/payments/webhook', to: 'payments#webhook'
  get 'payments/success', to: 'payments#success'
  resources :carts
end
