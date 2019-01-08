class CommentPolicy < ApplicationPolicy
  def create?
    user.user?
  end
end
