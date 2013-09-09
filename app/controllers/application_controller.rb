class ApplicationController < ActionController::API
  include ActionController::MimeResponds, ActionController::ImplicitRender

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json
end
