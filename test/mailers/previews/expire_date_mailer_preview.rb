# Preview all emails at http://localhost:3000/rails/mailers/expire_date_mailer
class ExpireDateMailerPreview < ActionMailer::Preview
  def expire_notification
    ExpireDateMailer.with(user: User.find(5), ticket: Ticket.find(36)).expire_notification
  end
end
