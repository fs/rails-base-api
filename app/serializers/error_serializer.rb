class ErrorSerializer < ActiveModel::Serializer::ErrorSerializer
  attributes :id, :status, :error, :validations
  attribute :validations, if: :include_validations?

  def include_validations?
    object.validations.present?
  end
end
