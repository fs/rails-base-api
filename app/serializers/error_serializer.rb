class ErrorSerializer < ActiveModel::Serializer::ErrorSerializer
  include NullAttributesRemover

  attributes :id, :status, :error, :validations
end
