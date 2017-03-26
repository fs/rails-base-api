class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include RequestHelper
  include Authentication

  respond_to :json
end
