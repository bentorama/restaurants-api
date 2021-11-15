class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update?
    # only the restaurant owner can update the restaurant
    record.user == user
  end

  def create?
    # any logged in user can create a restuarant
    !user.nil?
  end
end
