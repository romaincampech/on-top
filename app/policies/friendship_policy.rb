class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    true
  end

  def destroy?
    user == record.user || user == record.friend
  end
end
