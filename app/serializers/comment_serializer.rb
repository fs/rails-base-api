class CommentSerializer < ApplicationSerializer
  attributes :id, :title, :text

  has_one :post
  has_one :user
end
