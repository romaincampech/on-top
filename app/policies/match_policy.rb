class MatchPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def update?
    true
  end

  def show?
    true
  end

end
