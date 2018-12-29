class TicketPolicy < ApplicationPolicy
  def create?
    user.owner?
  end

  def update?
    user.owner?
  end

  def destroy?
    user.owner?
  end
end
