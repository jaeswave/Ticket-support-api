Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Users
  resources :users, only: [:create]

  # Auth
  post '/login', to: 'auth#login'
  delete '/logout', to: 'auth#logout'
  get 'tickets/export_csv', to: 'tickets#export_csv'


  # Enable GraphiQL in development only
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
end
