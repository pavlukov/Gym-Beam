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
#

class SportSection < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :sport_sections
end
