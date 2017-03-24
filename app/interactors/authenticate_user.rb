class AuthenticateUser
  include Interactor

  delegate :username, :password, to: :context

  def call
    user = User.find_by(username: username)
    if user && user.authenticate(password)
      context.token = generate_token(user.id)
    else
      context.fail!
    end
  end

  private

  def generate_token(user_id)
    payload = { user_id: user_id }
    auth_token = JWTWrapper.encode(payload)
    refresh_token_time = Rails.application.secrets.jwt_refresh_expiration_hours
    refresh_token = JWTWrapper.encode(payload, refresh_token_time)
    Token.new(auth_token, refresh_token)
  end
end
