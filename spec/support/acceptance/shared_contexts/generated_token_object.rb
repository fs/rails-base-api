shared_context "generate token object" do
  let(:user) { create :user }
  let(:token) { generate_token(user) }

  def generate_token(user)
    auth_payload = JWTPayload.payload_for(user, type: Token::TYPES[:access])
    auth_token = JWTWrapper.encode(auth_payload)
    refresh_payload = JWTPayload.payload_for(user, type: Token::TYPES[:refresh])
    refresh_token = JWTWrapper.encode(refresh_payload)
    Token.new(auth_token, refresh_token)
  end
end
