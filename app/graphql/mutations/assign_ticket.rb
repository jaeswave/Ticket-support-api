module Mutations
    class AssignTicket < BaseMutation
      argument :ticket_id, ID, required: true
  
      field :ticket, Types::TicketType, null: true
      field :errors, [String], null: false
  
      def resolve(ticket_id:)
        # 1. Find ticket (with error handling)
        ticket = Ticket.find_by(id: ticket_id)
        return { ticket: nil, errors: ["Ticket not found"] } unless ticket
  
        # 2. Authorization check
        current_user = context[:current_user]
        unless current_user.role == 'agent'  # or current_user.agent? if you have the method
          return { ticket: nil, errors: ["Only agents can assign tickets"] }
        end
  
        # 3. Atomic assignment and status update
        if ticket.update(
          agent_id: current_user.id,
          status: 'in_progress'
        )
          { ticket: ticket, errors: [] }
        else
          { ticket: nil, errors: ticket.errors.full_messages }
        end
      end
    end
  end