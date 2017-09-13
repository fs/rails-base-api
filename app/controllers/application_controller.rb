class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  acts_as_token_authentication_handler_for User
  respond_to :json
end
