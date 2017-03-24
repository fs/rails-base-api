class RefreshToken
  include Interactor

  delegate :user, :http_token, to: :context

  def call
    payload = { user_id: user.id }
    auth_token = JWTWrapper.encode(payload)
    context.token = Token.new(auth_token, http_token)
  end
end
