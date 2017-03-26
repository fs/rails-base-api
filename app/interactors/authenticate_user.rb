class AuthenticateUser
  include Interactor

  delegate :username, :password, to: :context

  def call
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      context.token = generate_token(user)
    else
      context.fail!
    end
  end

  private

  def generate_token(user)
    access_token = generate_access_token(user)
    refresh_token = generate_refresh_token(user)
    Token.new(access_token, refresh_token)
  end

  def generate_access_token(user)
    payload = JWTPayload.payload_for user
    JWTWrapper.encode(payload)
  end

  def generate_refresh_token(user)
    refresh_time = Rails.application.secrets.jwt_refresh_expiration_hours
    token_type = Token::TYPES[:refresh]
    payload = JWTPayload.payload_for(user, type: token_type, expiration: refresh_time)
    JWTWrapper.encode(payload)
  end
end
