class PostSerializer < ActiveModel::Serializer
  root false
  attributes :id, :title, :text
end
