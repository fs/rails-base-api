class Post < ActiveRecord::Base
  validates :title, :text, presence: true
end
