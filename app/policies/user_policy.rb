class UserPolicy < ApplicationPolicy
  def manage?
    user == record
  end
end
