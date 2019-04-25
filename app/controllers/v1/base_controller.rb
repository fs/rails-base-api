module V1
  class BaseController < ActionController::API
    include Knock::Authenticable

    before_action :authenticate_user!

    self.responder = ::ApiResponder
    respond_to :json

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      respond_with_error(:record_not_found)
    end

    private

    def respond_with_error(code)
      Error.new(code: code).tap do |error|
        render json: error.to_json, status: error.status
      end
    end

    def authenticate_user!
      return if current_user

      render json: { error: "unauthorized" }, status: :unauthorized
    end

    def current_user
      @current_user ||= token && authenticate_for(User)
    end
  end
end
