require "./lib/jsonapi/responder"

module V1
  class SessionsController < Devise::SessionsController
    include ActionController::ImplicitRender
    include JSONAPI::Utils
    self.responder = JSONAPI::Responder

    respond_to :api_json

    def create
      devise_parameter_sanitizer.for(:sign_in) << :data

      user = AuthenticateUser.call(warden: warden, params: params).user
      respond_with user
    end
  end
end
