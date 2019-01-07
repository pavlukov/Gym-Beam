# == Schema Information
#
# Table name: tickets_users
#
#  ticket_id  :bigint(8)        not null
#  user_id    :bigint(8)        not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  id         :bigint(8)        not null, primary key
#

class TicketsUser < ApplicationRecord
  belongs_to :ticket
  belongs_to :user

  validates_uniqueness_of :ticket_id, message: 'You have already subscribed to this ticket', scope: :user_id
end
