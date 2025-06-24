namespace :tickets do
    desc "Send email reminders to agents with open or pending tickets"
    task send_reminders: :environment do
      agents = User.where(role: "agent")
  
      agents.each do |agent|
        tickets = Ticket.where(status: ["in_progress"], agent_id: agent.id)
  
        if tickets.any?
          begin
            TicketMailer.unresolved_tickets(agent, tickets).deliver_now
            puts "Sent reminder to #{agent.email}"
  
            File.open(Rails.root.join("log", "ticket_reminders.log"), "a") do |f|
              f.puts "[#{Time.now}] Sent reminder to #{agent.email} for #{tickets.count} tickets"
            end
          rescue => e
            puts "Error sending to #{agent.email}: #{e.message}"
          end
        end
      end
    end
  end
  