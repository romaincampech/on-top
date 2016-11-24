class FriendshipPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def destroy?
    user == record.user || user == record.friend
  end
end
