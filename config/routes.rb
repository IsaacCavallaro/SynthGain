Rails.application.routes.draw do
  get 'payments/webhook'
  devise_for :users
  root to: 'pages#home'
  get 'pages/about', to: 'pages#about'
  devise_for :installs
  resources :listings
  post '/payments/webhook', to: 'payments#webhook'
  get 'payments/success', to: 'payments#success'
  get 'pages/cart', to: 'pages#cart'
end
