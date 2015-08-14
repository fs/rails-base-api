module RailsApiFormat
  class Error
    include ActiveModel::Model
    include ActiveModel::Serialization

    attr_accessor :status, :error, :validations

    def attributes
      {
        status: status,
        error: error,
        validations: validations
      }.with_indifferent_access
    end

    def to_json(options = {})
      # Specify root element as `error` instead of auto generated `rails_api_format/error`
      # https://github.com/rails-api/active_model_serializers/pull/1029#issuecomment-131896282
      ActiveModel::SerializableResource.serialize(self, options.merge(root: :error)).to_json
    end

    def status
      Rack::Utils.status_code(@status)
    end
  end
end
