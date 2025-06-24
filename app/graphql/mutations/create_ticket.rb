module Mutations
  class CreateTicket < BaseMutation
    argument :title, String, required: true
    field :ticket, Types::TicketType, null: false

    def resolve(title:)
      authenticate! #
      
      # If yes, create the ticket!
      ticket = current_user.tickets.create!(
        title: title,
        status: "open"
      )

      { ticket: ticket }
    end
  end
end