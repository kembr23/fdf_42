Rails.application.routes.draw do
  root "static_pages#home"

  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  resources :users, except: :index
  resources :account_activations, only: :edit
  resources :password_resets, except: %i(index show destroy)
  resources :products, only: %i(index show)
  resources :categories, only: :show

  get "add_cart/:product_id", to: "carts#add_cart", as: :add_cart
end