class SportSectionPolicy < ApplicationPolicy
  def create?
    user.owner?
  end

  def update?
    user.owner? and SportSectionsUser.where(sport_section_id: record.id, user_id: user.id).count > 0
  end

  def destroy?
    user.owner? and SportSectionsUser.where(sport_section_id: record.id, user_id: user.id).count > 0
  end
end
