Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  resources :meals do
    resources :meal_reviews, only: :create
    resources :meal_orders, only: [:create, :edit, :update]
  end

  resources :meal_orders, only: :destroy

  resources :orders, only: [:show, :create, :destroy] do
    resources :payments, only: [:new, :create]
  end

  resources :conversations do
    resources :messages
 end

  get '/dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'
end


