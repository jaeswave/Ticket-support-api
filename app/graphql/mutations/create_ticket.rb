module Mutations
    class CreateTicket < BaseMutation
      argument :title, String, required: true
  
      field :ticket, Types::TicketType, null: false
  
      def resolve(title:)
        user = context[:current_user]
  
        raise GraphQL::ExecutionError, "Authentication required" unless user
  
        ticket = user.tickets.create!(
          title: title,
          status: "open"
        )
  
        { ticket: ticket }
      end
    end
  end
  