# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# Set the path for the cron log (optional but useful)
set :output, "log/cron.log"

# Set the Rails environment if you're using something other than production
# set :environment, "development"

# Every day at 9:00 AM, run the Rake task to send reminders
every 1.day, at: '9:00 am' do
  rake "tickets:send_reminders"
end

# Learn more: http://github.com/javan/whenever
