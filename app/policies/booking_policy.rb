class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user_id: user)
    end
  end

  def create?
    true
  end

  def update?
    true
  end
end
