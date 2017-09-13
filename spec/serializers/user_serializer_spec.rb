require "rails_helper"

describe UserSerializer do
  let(:user) { build :user, id: 1, authentication_token: "token" }
  let(:json) { ActiveModel::SerializableResource.serialize(user).to_json }
  let(:user_json) { parse_json(json)["user"] }

  it "returns user" do
    expect(user_json).to be_a_user_representation(user)
  end
end
