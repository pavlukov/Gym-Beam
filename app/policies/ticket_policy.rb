class TicketPolicy < ApplicationPolicy
  def create?
    user.owner?
  end

  def update?
    user.owner? and TicketsUser.where(ticket_id: record.id, user_id: user.id).count > 0
  end

  def destroy?
    user.owner? and TicketsUser.where(ticket_id: record.id, user_id: user.id).count > 0
  end
end
