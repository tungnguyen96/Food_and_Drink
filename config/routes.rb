Rails.application.routes.draw do
  root "products#index"

  resources :categories, only: %i(index show)
  resources :products, only: %i(index show)
  resources :orders, only: %i(new show create destroy)
  resources :carts
  resources :ratings, only: :create
  resources :feedbacks, only: %i(new create)
  resources :product_orders, only: %i(show)

  namespace :account do
    resources :sessions, only: %i(new create destroy)
    resources :users, only: %i(new create show edit update)
  end

  namespace :admin do
    root "dashboard#home"
    resources :users, only: %i(index destroy)
    resources :products, only: %i(index new create edit update destroy)
    resources :categories, only: %i(index new create edit update destroy)
    resources :orders, only: %i(index destroy)
  end
end
