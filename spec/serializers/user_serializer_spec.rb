require "rails_helper"

describe UserSerializer do
  let(:user) { build :user }
  let(:json) { ActiveModelSerializers::SerializableResource.new(user).to_json }
  let(:user_json) { parse_json_data(json) }

  it "returns user" do
    expect(user_json).to be_a_user_representation(user)
  end
end
