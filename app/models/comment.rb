class Comment < ApplicationRecord
  has_many_attached :files
  belongs_to :user
  belongs_to :ticket
end
