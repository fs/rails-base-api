class Post < ActiveRecord::Base
  validates :title, :text, presence: true
  has_many :comments

  scope :with_comments_and_users, -> { includes(comments: :user) }
end
