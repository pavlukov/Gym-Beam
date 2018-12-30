class TicketPolicy < ApplicationPolicy
  def create?
    user.owner?
  end

  def update?
    user.owner? and user.tickets.find(record.id)
  end

  def destroy?
    user.owner? and user.tickets.find(record.id)
  end
end
