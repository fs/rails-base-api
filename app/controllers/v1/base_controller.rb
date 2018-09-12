module V1
  class BaseController < ActionController::API
    include Knock::Authenticable

    before_action :authenticate_user!

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      respond_with_error(:record_not_found)
    end

    private

    def authenticate_user!
      respond_with_error(:unauthorized) if current_user.blank?
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

    def respond_with_resource_errors(resource, status: :unprocessable_entity)
      render jsonapi: resource, serializer: ActiveModel::Serializer::ErrorSerializer, status: status
    end

    def respond_with_error(code)
      Error.new(code: code).tap do |error|
        render json: error.to_json, status: error.status
      end
    end

    def jsonapi_params(options)
      ActiveModelSerializers::Deserialization.jsonapi_parse!(params, options)
    end
  end
end
