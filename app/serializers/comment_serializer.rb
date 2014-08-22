class CommentSerializer < ApplicationSerializer
  attributes :id, :title, :text

  has_one :post, serializer: CommentPostSerializer
  has_one :user
end
