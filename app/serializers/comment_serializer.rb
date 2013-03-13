class CommentSerializer < BaseSerializer
  attributes :id, :title, :text
  has_one :post
end
