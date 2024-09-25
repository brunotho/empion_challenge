Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  root "home#index"

  resources :culture_types, only: [ :index, :create, :new ]
  resources :applicants, only: [ :index, :create, :new ]
  resources :companies, only: [ :index, :show, :create, :new ]
end
