

  class User < ApplicationRecord
    has_secure_password
  
    validates :email, presence: true, uniqueness: true
    validates :password, length: { minimum: 6 }, if: -> { password_digest_changed? }
    validates :role, presence: true, inclusion: { in: ['customer', 'agent'] }
    validates :invite_code, presence: true, if: -> { role == 'agent' }
    validates :name, presence: true

  
    has_many :tickets, foreign_key: :customer_id
    has_many :assigned_tickets, foreign_key: :agent_id, class_name: 'Ticket'
    has_many :comments
  end
  