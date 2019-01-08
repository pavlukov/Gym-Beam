class UserPolicy < ApplicationPolicy
  def unapproved_list?
    user.admin?
  end

  def confirm?
    user.admin?
  end

  def reject?
    user.admin?
  end
end
