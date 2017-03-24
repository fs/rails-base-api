class TodoItem < ActiveRecord::Base
  belongs_to :user

  enum status: %w(created completed)

  validates :title, :user, presence: true
end
