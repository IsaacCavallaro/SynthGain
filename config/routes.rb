Rails.application.routes.draw do
  get "buyers", to: "buyers#index", as: "buyers"
  get "users_info", to: "users_info#index", as: "users_info"
  get "users_info/show/:id", to: "users_info#show", as: "users_info_show_profile"
  post "users_info/create", to: "users_info#create", as: "users_info_create"
  get "users_info/edit", to: "users_info#edit", as: "users_info_edit"
  patch "users_info/update", to: "users_info#update", as: "users_info_update"
  get "users_info/new/:id", to: "users_info#new", as: "users_info_new"
  get "payments/orders", to: "payments#orders", as: "payments_orders"
  devise_for :users
  root to: "pages#home"
  get "pages/about", to: "pages#about"
  resources :listings
  post "/payments/webhook", to: "payments#webhook"
  get "/payments/success", to: "payments#success"
end
