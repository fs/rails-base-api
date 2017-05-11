class GenerateToken
  include Interactor

  delegate :user, to: :context

  def call
    context.token = Token.new(generate_access_token, generate_refresh_token)
  end

  private

  def generate_access_token
    payload = JWTPayload.payload_for user
    JWTWrapper.encode(payload)
  end

  def generate_refresh_token
    refresh_time = Rails.application.secrets.jwt_refresh_expiration_hours
    token_type = Token::TYPES[:refresh]
    payload = JWTPayload.payload_for(user, type: token_type, expiration: refresh_time)
    JWTWrapper.encode(payload)
  end
end
