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

require 'test_helper'

class TicketsUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
