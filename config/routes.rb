Rails.application.routes.draw do
  get 'doses/index'
  get 'meal_plans/index'
  get 'meal_plans/show'
  get 'meal_plans/new'
  get 'meal_plans/create'
  get 'meals/show'
  get 'deliveries/new'
  post 'deliveries/create'
  get "shop/shopping"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :meal_plans do
    resources :meals, only: [:show, :update]
    resources :doses, only: [:index]
    resources :shops, only: [:new, :create]
    resources :deliveries, only: [:new, :create]
  end
  require "sidekiq/web"
  # authenticate :user, lambda { |u| u.admin } do
  mount Sidekiq::Web => '/sidekiq'
  # end
end
