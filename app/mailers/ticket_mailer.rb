
class TicketMailer < ApplicationMailer
  def unresolved_tickets(user, tickets)
    @agent = user  # ✅ Add this line
    @tickets = tickets
    mail(to: user.email, subject: "Unresolved Tickets Reminder")
  end
end