require "rails_helper"

describe TokenSerializer do
  include_context "generate token object"

  let(:json) { ActiveModelSerializers::SerializableResource.new(token, serializer: described_class).to_json }
  let(:user_json) { parse_json(json)["token"] }

  it "returns valid tokens" do
    expect(user_json).to be_a_token_representation
  end
end
