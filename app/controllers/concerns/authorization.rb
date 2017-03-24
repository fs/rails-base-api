module Authorization
  extend ActiveSupport::Concern

  included do
    include Pundit
    include JSONAPI::Utils::Response::Formatters

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  end

  private

  def user_not_authorized
    errors = jsonapi_format_errors JSONAPI::AuthenticationError
    render json: { errors: [errors] }, status: :unauthorized
  end
end
