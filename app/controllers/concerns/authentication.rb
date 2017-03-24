module Authentication
  extend ActiveSupport::Concern

  include RequestHelper

  included do
    attr_reader :current_user
  end

  def authenticate_user
    if user_id_in_token?
      @current_user = User.find_by(id: auth_token[:user_id])
    else
      head :unauthorized
    end
  rescue JWT::ExpiredSignature
    hean :forbidden
  rescue JWT::VerificationError, JWT::DecodeError
    head :unauthorized
  end
end
