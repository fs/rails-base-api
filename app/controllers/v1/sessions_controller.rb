module V1
  class SessionsController < Devise::SessionsController
    include ActionController::ImplicitRender
    include JSONAPI::Utils
    self.responder = JSONAPI::Responder

    acts_as_token_authentication_handler_for User, fallback: :exception, only: :destroy

    skip_filter :verify_signed_out_user, only: :destroy
    respond_to :api_json

    def create
      devise_parameter_sanitizer.for(:sign_in) << :data

      user = AuthenticateUser.call(warden: warden, params: params).user
      respond_with user
    end

    def destroy
      current_user.update(authentication_token: nil)

      respond_with current_user
    end
  end
end
