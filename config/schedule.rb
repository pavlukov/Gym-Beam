# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

set :output, { error: 'Gym\ Beam/log/whenever_error.log', standard: 'Gym\ Beam/log/whenever.log' }

every 1.day, at: '12pm' do
  rake 'send_email:send_email'
  command  "echo 'sending email'"
end

every 1.hour  do
  command "echo 'zdarova'"
end
