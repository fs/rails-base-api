class ApplicationController < ActionController::API
  include ActionController::ImplicitRender

  respond_to :json
end
