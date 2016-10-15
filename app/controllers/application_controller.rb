require "./lib/jsonapi/responder"

class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include JSONAPI::Utils
  acts_as_token_authentication_handler_for User, fallback: :exception

  rescue_from ActiveRecord::RecordNotFound, with: :jsonapi_render_not_found

  respond_to :api_json
end
