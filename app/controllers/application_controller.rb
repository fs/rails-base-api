class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  include SkipTrackable
  include TokenAuthentication

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json
end
