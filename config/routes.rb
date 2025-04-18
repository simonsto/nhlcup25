Rails.application.routes.draw do
  get "users/leaderboard"
  get "matchups/index"
  get "predictions/create"
  get "predictions/destroy"
  get "user_groups/index"
  get "user_groups/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "leaderboard", to: "users#leaderboard"
  get "my_picks", to: "users#my_picks"



  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "matchups#index"

  post "join_group", to: "user_groups#join", as: :join_user_group

  resources :user_groups, path: "groups", only: [ :index, :show, :new, :create ]
  resources :predictions, only: [ :create, :destroy ]
  resources :matchups, only: [ :index ]
end
