class TodoItem < ActiveRecord::Base
  belongs_to :user

  enum status: %w(created completed)

  validates :title, presence: true
  validates :user, presence: true
end