# app/graphql/types/user_type.rb
module Types
    class UserType < Types::BaseObject
      field :id, ID, null: false
      field :email, String, null: false
      field :role, String, null: false
      # Add other user fields you need like:
      # field :name, String, null: true
      # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    end
  end