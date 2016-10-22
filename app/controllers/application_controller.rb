require "./lib/jsonapi/responder"

class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include JSONAPI::Utils
  self.responder = JSONAPI::Responder

  rescue_from ActiveRecord::RecordNotFound, with: :jsonapi_render_not_found

  respond_to :api_json
end
