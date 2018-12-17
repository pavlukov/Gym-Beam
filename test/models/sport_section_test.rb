# == Schema Information
#
# Table name: sport_sections
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  coach_name  :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  adress      :string
#

require 'test_helper'

class SportSectionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
