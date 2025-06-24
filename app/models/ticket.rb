# # app/models/ticket.rb
# class Ticket < ApplicationRecord
#   belongs_to :customer, class_name: 'User'
#   has_many :comments
# end


# app/models/ticket.rb
class Ticket < ApplicationRecord
  belongs_to :customer, class_name: 'User'
  belongs_to :agent, class_name: 'User', optional: true  #LINE
  has_many :comments
end
