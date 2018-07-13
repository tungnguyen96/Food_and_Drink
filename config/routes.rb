Rails.application.routes.draw do
  namespace :account do
    root "pages#home"
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
