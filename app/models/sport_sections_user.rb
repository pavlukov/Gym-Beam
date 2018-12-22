class SportSectionsUser < ApplicationRecord
  belongs_to :sport_section
  belongs_to :user
  validates_uniqueness_of :sport_section_id, scope: :user_id
end
