# == Schema Information
#
# Table name: sport_sections_users
#
#  sport_section_id :bigint(8)        not null
#  user_id          :bigint(8)        not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  id               :bigint(8)        not null, primary key
#

class SportSectionsUser < ApplicationRecord
  belongs_to :sport_section
  belongs_to :user
end
