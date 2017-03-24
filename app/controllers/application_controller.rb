class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include Authentication
  
  respond_to :json

  def respond_with_token(token)
    render json: { authentication_token: token }, status: :created
  end
end
