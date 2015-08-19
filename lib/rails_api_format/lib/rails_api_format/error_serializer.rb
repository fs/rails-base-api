module RailsApiFormat
  class ErrorSerializer < ActiveModel::Serializer
    attributes :id, :status, :error, :validations

    private

    def include_validations?
      validations
    end
  end
end
