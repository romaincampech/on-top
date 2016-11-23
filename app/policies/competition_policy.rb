class CompetitionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  # def update?
  #   user_is_owner? || user.admin
  # end

  # def destroy?
  #   user_is_owner? || user.admin
  #  TO DO - more complicated method that if the competition has /
  #    started (any matches have begun, do not allow to destroy)
  # end

  private

  def user_is_owner?
    record.user == user
  end
end
