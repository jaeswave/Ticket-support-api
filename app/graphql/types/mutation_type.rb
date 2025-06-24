module Types
  class MutationType < Types::BaseObject
    field :create_ticket, mutation: Mutations::CreateTicket
    field :create_comment, mutation: Mutations::CreateComment
    field :assign_ticket, mutation: Mutations::AssignTicket


  end
end
