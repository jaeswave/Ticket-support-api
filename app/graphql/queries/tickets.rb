# frozen_string_literal: true

module Queries
    class Tickets < BaseQuery
      type [Types::TicketType], null: false
  
      def resolve
        user = context[:current_user]
        return [] unless user
  
        if user.role == 'agent'
          Ticket.all
        else
          Ticket.where(customer_id: user.id)
        end
      end
    end
  end