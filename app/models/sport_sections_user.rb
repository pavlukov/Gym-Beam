class SportSectionsUser < ApplicationRecord
  belongs_to :sport_sections
  belongs_to :users
  #validates_uniqueness_of :sport_section_id, scope: :user_id
end
