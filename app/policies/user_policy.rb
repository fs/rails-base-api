class UserPolicy < ApplicationPolicy
  def update?
    user == record
  end
end
