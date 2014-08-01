class Comment < ActiveRecord::Base
  validates :text, :title, presence: true

  belongs_to :post
  belongs_to :user

  scope :with_posts_and_users, -> { includes(:user, :post) }
end
