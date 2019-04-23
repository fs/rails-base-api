require "rails_helper"

resource "Tokens" do
  include_context "with API Headers"
  include_context "with frozen time"

  post "/v1/tokens" do
    with_options scope: :authorization do
      parameter :email, "email", required: true
      parameter :password, "password", required: true
    end

    let!(:user) { create :user, email: email, password: "123456" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }

    let(:jwt_token) { build(:jwt_token, subject: user) }

    let(:expected_data) { { "token" => jwt_token.token } }

    example_request "Create Token" do
      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_data)
    end

    context "with invalid password" do
      let(:password) { "invalid" }
      let(:expected_data) { { "error" => "Invalid credentials" } }

      example_request "Create Token with invalid password" do
        expect(response_status).to eq(422)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end
end
