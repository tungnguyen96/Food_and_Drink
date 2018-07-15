Rails.application.routes.draw do
  namespace :account do
    resources :sessions, only: %i(new create destroy)
    resources :users, only: %i(new create show edit update)
    resources :products, only: %i(index show)
    resources :orders, only: %i(show new create edit update destroy)
  end

  namespace :admin do
    root "dashboard#home"
    resources :users, only: %i(index destroy)
    resources :products, only: %i(index new create edit update destroy)
    resources :categories, only: %i(index new create edit update destroy)
    resources :orders, only: %i(index destroy)
  end
end
