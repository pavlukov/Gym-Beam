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

class Ticket < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :sport_sections
end
