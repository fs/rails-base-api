require "rails_helper"

describe CreateJwt do
  subject(:result) { described_class.call(user_attributes) }

  let(:user_attributes) do
    {
      email: "john.smith@example.com",
      password: "123456"
    }
  end

  before do
    create :user, email: "john.smith@example.com", password: "123456"
  end

  it "authenticates user" do
    is_expected.to be_success

    expect(result.jwt_token).to be_present
  end

  context "when invalid credentials" do
    let(:user_attributes) do
      {
        email: "john.smith@example.com",
        password: "invalid password"
      }
    end

    it "does not authenticate user" do
      is_expected.to be_failure

      expect(result.jwt_token).to be_nil
    end
  end
end
