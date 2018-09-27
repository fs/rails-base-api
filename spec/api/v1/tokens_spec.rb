require "rails_helper"

resource "Tokens" do
  include_context "with JSON API Headers"
  include_context "with frozen time"

  post "/v1/tokens" do
    with_options scope: %i[data attributes] do
      parameter :email, "email", required: true
      parameter :password, "password", required: true
    end

    let!(:user) { create :user, email: email, password: "123456" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }

    let(:jwt_token) { build(:jwt_token, subject: user) }

    let(:expected_data) do
      {
        "data" => {
          "id" => jwt_token.token,
          "type" => "jwt_tokens",
          "attributes" => {
            "token" => jwt_token.token
          }
        }
      }
    end

    example "Create Token" do
      do_request

      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_data)
    end

    context "with invalid password" do
      let(:password) { "invalid" }

      let(:expected_data) do
        {
          "errors" => [{
            "code" => "invalid_credentials",
            "detail" => "Invalid credentials"
          }]
        }
      end

      example "Create Token with invalid password" do
        do_request

        expect(response_status).to eq(422)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end
end
