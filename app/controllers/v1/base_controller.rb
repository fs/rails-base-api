module V1
  class BaseController < ActionController::API
    include Knock::Authenticable

    before_action :authenticate_user

    private

    def authenticate_user
      respond_with_unauthorized if current_user.blank?
    end

    def current_user
      @current_user ||= token && authenticate_for(User)
    end

    def respond_with_resource(resource, status: :ok, location: resource, include: nil, fields: nil)
      render jsonapi: resource, include: include, status: status, location: location, fields: fields
    end

    def respond_with_resources(resources, include: nil, fields: nil)
      respond_with_resource(resources, include: include, location: nil, fields: fields)
    end

    def respond_with_resource_errors(resource)
      render jsonapi: resource, serializer: ActiveModel::Serializer::ErrorSerializer, status: :unprocessable_entity
    end

    def respond_with_error(message, status: :unprocessable_entity)
      render jsonapi: Error.new(base: message), serializer: ActiveModel::Serializer::ErrorSerializer, status: status
    end

    def respond_with_unauthorized
      respond_with_error(I18n.t("interactors.authenticate.invalid_credentials"), status: :unauthorized)
    end

    def jsonapi_params(options)
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, options)
    end
  end
end
