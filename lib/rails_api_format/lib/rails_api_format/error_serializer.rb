module RailsApiFormat
  class ErrorSerializer < ActiveModel::Serializer
    attributes :status, :error, :validations

    private

    def include_validations?
      validations
    end
  end
end
