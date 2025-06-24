# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :node, Types::NodeType, null: true, description: "Fetches an object given its ID." do
      argument :id, ID, required: true, description: "ID of the object."
    end

    def node(id:)
      context.schema.object_from_id(id, context)
    end

    field :nodes, [Types::NodeType, null: true], null: true, description: "Fetches a list of objects given a list of IDs." do
      argument :ids, [ID], required: true, description: "IDs of the objects."
    end

    def nodes(ids:)
      ids.map { |id| context.schema.object_from_id(id, context) }
    end

    # Add your tickets query here
    # field :tickets, [Types::TicketType], null: false,
    #       resolver: Queries::Tickets,
    #       description: "Fetch tickets. Agents see all tickets, customers see only their own."
    field :tickets, [Types::TicketType], null: false,
      description: "Fetch tickets. Agents see all tickets, customers see only their own."

def tickets
  user = context[:current_user]

  if user.nil?
    raise GraphQL::ExecutionError, "Authentication required"
  end

  if user.role == "agent"
    Ticket.all
  else
    Ticket.where(customer_id: user.id)
  end
end

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end
  end
end
