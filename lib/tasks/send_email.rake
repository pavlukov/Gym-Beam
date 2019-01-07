require 'rake'
require 'date'

namespace :send_email do
  DAYS_TO_NOTIFY = 3

  desc 'sending email to users, whose gym membership is about to expire'
  task :send_email => :environment do
    tickets = Ticket.all.to_a
    tickets.select! do |ticket|
      ticket.expire_date >= Date.today and ticket.expire_date - Date.today <= DAYS_TO_NOTIFY
    end
    users = []
    tickets.each do |ticket|
      ticket.users.each do |user|
        ExpireDateMailer.with(user: user, ticket: ticket).expire_notification.deliver_now
      end
    end
  end
end
