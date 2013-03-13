class BaseSerializer < ActiveModel::Serializer
  embed :ids, include: false
end
