class TodoItemPolicy < ApplicationPolicy
  def update?
    user == record.user
  end
end
