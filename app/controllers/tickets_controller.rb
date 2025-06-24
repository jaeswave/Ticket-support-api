require 'csv'

class TicketsController < ApplicationController
  before_action :authorize_agent!

  def export_csv
    tickets = Ticket.includes(:customer)

    csv_data = CSV.generate(headers: true) do |csv|
      csv << ["ID", "Title", "Status", "Customer Email"]
      tickets.each do |ticket|
        csv << [ticket.id, ticket.title, ticket.status, ticket.customer.email]
      end
    end

    send_data csv_data, filename: "tickets_#{Date.today}.csv"
  end

  private

  def authorize_agent!
    user = authenticate_and_get_user
    if user.nil?
      render plain: "Please log in", status: :unauthorized
    elsif user.role != "agent"
      render plain: "Access denied", status: :unauthorized
    end
  end

  def authenticate_and_get_user
    auth_header = request.headers['Authorization']
    token = auth_header&.split(' ')&.last
    payload = JwtService.decode(token)

    return nil unless payload
    User.find_by(id: payload["user_id"])
  end
end
