# == Schema Information
#
# Table name: tickets
#
#  id               :bigint(8)        not null, primary key
#  expire_date      :date
#  visits_remaining :integer
#  cost             :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
