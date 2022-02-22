class RestaurantPolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    # if the current_user is the owner of the record
    # OR curren_user is an admin!
    user == record.user || user.admin?
  end

  def destroy?
    user == record.user || user.admin?
  end

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
      # Select all Restaurants where the user (owner) is the current_user
      # scope.where(user: user)
    end
  end
end
