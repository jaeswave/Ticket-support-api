Rails.application.routes.draw do
  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check

  # Users routes, only create for now
  resources :users, only: [:create]

  # You can add other routes here later
end
