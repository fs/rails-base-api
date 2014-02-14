class ApplicationController < ActionController::API
  include ActionController::MimeResponds, ActionController::ImplicitRender
  include SkipTrackable

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json

  # TODO: move to separate class
  def authenticate_user!
    authenticate_user_from_token!
    super
  end

  def authenticate_user_from_token!
    user_token = request.headers['X-AUTH-TOKEN'].presence
    user = user_token && User.where(authentication_token: user_token).first

    sign_in(user, store: false) if user
  end
end
