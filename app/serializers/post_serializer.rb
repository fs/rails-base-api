class PostSerializer < BaseSerializer
  attributes :id, :title, :text
  has_many :comments
end
