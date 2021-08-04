Rails.application.routes.draw do
  get 'buyers/index', to: 'buyers#index', as: 'buyers'
  get 'buyers/show'
  get 'buyers/edit'
  get 'buyers/delete'
  get 'users_info/index', to: 'users_info#index', as: 'users_info'
  get 'users_info/show/:id', to: 'users_info#show', as: 'users_info_show_profile'
  get 'users_info/create'
  post 'users_info/create', to: 'users_info#create', as: 'users_info_create_post'
  get 'users_info/edit', to: 'users_info#edit', as: 'users_info_edit'
  post 'users_info/update', to: 'users_info#update', as: 'users_info_update'
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
