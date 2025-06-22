module Types
    class TicketType < Types::BaseObject
      field :id, ID, null: false
      field :title, String, null: false
      field :status, String, null: false
      field :customer, Types::UserType, null: false
      field :agent, Types::UserType, null: true
      field :comments, [Types::CommentType], null: true
    end
  end
  