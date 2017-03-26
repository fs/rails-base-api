module Authentication
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user
  end

  def authenticate_token_by_type(type = Token::TYPES[:access])
    if token_valid_for? type
      @current_user = User.find_by(id: auth_token[:sub])
    else
      head :unauthorized
    end
  rescue JWT::ExpiredSignature
    head :forbidden
  rescue JWT::VerificationError, JWT::DecodeError
    head :unauthorized
  end
end
