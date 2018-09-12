class ErrorSerializer < ActiveModel::Serializer::ErrorSerializer
  attributes :code, :detail
end
