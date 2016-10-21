class TodoItem < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :user, presence: true
end
