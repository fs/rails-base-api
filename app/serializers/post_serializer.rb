class PostSerializer < ApplicationSerializer
  attributes :id, :title, :text

  has_many :comments, serializer: PostCommentSerializer
end
