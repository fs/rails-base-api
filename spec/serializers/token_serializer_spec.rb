require "rails_helper"

describe TokenSerializer do
  def generate_token(user)
    auth_payload = JWTPayload.payload_for(user, type: Token::TYPES[:access])
    auth_token = JWTWrapper.encode(auth_payload)
    refresh_payload = JWTPayload.payload_for(user, type: Token::TYPES[:refresh])
    refresh_token = JWTWrapper.encode(refresh_payload)
    Token.new(auth_token, refresh_token)
  end

  let(:user) { build(:user) }
  let(:token) { generate_token(user) }

  let(:json) { ActiveModelSerializers::SerializableResource.new(token, serializer: described_class).to_json }
  let(:user_json) { parse_json(json)["token"] }

  it "returns valid tokens" do
    expect(user_json).to be_a_token_representation
  end
end
