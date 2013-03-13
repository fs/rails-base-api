class Post < ActiveRecord::Base
  validates :title, :text, presence: true
  has_many :comments
end
