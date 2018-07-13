Rails.application.routes.draw do
  root "pages#home"
  namespace :account do
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    resources :users
    resources :products
    resources :orders
  end

  namespace :admin do
    resources :users
    resources :products
    resources :categories
    resources :orders
  end
end
