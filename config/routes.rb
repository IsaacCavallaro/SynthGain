Rails.application.routes.draw do
  get 'users_info/index'
  get 'users_info/show'
  get 'users_info/create'
  get 'users_info/edit'
  get 'users_info/destroy'
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
