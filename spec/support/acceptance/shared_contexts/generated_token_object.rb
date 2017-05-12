shared_context "generate token object" do
  let(:user) { create :user }
  let(:token) { generate_token_for user }

  def generate_token_for(user)
    auth_token = auth_token user
    refresh_token = refresh_token user
    Token.new(auth_token, refresh_token)
  end

  def auth_token(user)
    auth_payload = JWTPayload.payload_for(user, type: Token::TYPES[:access])
    JWTWrapper.encode(auth_payload)
  end

  def refresh_token(user)
    refresh_payload = JWTPayload.payload_for(user, type: Token::TYPES[:refresh])
    JWTWrapper.encode(refresh_payload)
  end
end
