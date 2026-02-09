Rails.application.routes.draw do
  get "top/index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root :to => "top#index"
  get "top/index", to: "top#index"
  get "top/new", to: "top#new"
  get "top/show/:id", to: "top#show", as: :top_show
  get "top/edit/:id", to: "top#edit", as: :top_edit
  post "newdates", to: "top#create"
  patch "top/:id", to: "top#update", as: :newdate
  delete "top/:id", to: "top#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
  resources :newdates
  resources :top
end
