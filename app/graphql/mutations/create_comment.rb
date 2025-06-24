# module Mutations
#   class CreateComment < BaseMutation
#     argument :ticket_id, ID, required: true
#     argument :content, String, required: true

#     # Matching CreateTicket's output style
#     field :comment, Types::CommentType, null: false  # Non-null like ticket
#     field :errors, [String], null: true              # Optional errors

#     def resolve(ticket_id:, content:)
#       authenticate! #

#       ticket = Ticket.find(ticket_id)
#       comment = ticket.comments.create!(
#         content: content,
#         user: current_user
#       )

#       { comment: comment }  # Simple return like CreateTicket
#     rescue ActiveRecord::RecordInvalid => e
#       { comment: nil, errors: [e.message] }  # Error handling if needed
#     end
#   end
# end



module Mutations
  class CreateComment < BaseMutation
    argument :ticket_id, ID, required: true
    argument :content, String, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: true

    def resolve(ticket_id:, content:)
      authenticate!
      ticket = Ticket.find(ticket_id)

      if current_user.role === "customer"
        last_comment = ticket.comments.order(created_at: :desc).first
        if last_comment&.user_id == current_user.id
          return {
            comment: "Sorry! you have to wait for an agent response",
            errors: ["Please wait for a support agent to respond before replying again."]
          }
        end
      end

      comment = ticket.comments.create!(
        content: content,
        user: current_user
      )

      { comment: comment, errors: [] }
    rescue ActiveRecord::RecordInvalid => e
      { comment: nil, errors: [e.message] }
    end
  end
end
