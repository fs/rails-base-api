module V1
  class BaseController < ActionController::API
    include Knock::Authenticable

    before_action :authenticate_user!

    self.responder = ::ApiResponder
    respond_to :json

    rescue_from ActiveRecord::RecordNotFound do |_exception|
      render json: { error: "not_found" }, status: :not_found
    end

    private

    def authenticate_user!
      return if current_user

      render json: { error: "unauthorized" }, status: :unauthorized
    end

    def current_user
      @current_user ||= token && authenticate_for(User)
    end
  end
end
