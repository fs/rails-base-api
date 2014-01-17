class ApplicationController < ActionController::API
  include ActionController::MimeResponds, ActionController::ImplicitRender
  include SkipTrackable

  self.responder = ApiResponder

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  respond_to :json

  def authenticate_user!
    authenticate_user_from_token!
    super
  end

  def authenticate_user_from_token!
    user_token = params[:authentication_token].presence
    user = user_token && User.where(authentication_token: user_token).first

    if user
      sign_in user, store: false
    end
  end
end
