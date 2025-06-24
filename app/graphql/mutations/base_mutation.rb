module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    # Helper to get the current user
    def current_user
      context[:current_user]
    end

    # Rule: "You must be logged in to do this!"
    def authenticate!
      return if current_user # Good, they're logged in!

      # If there's an auth error (from the controller), show it
      if context[:auth_error]
        raise GraphQL::ExecutionError, context[:auth_error]
      else
        raise GraphQL::ExecutionError, "Authentication required"
      end
    end
  end
end