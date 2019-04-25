require "rails_helper"

resource "Tokens" do
  include_context "with API Headers"

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
      let(:expected_data) do
        {
          "errors" => [
            {
              "id" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
              "status" => 422,
              "error" => "Invalid credentials"
            }
          ]
        }
      end

      example "Create Token with invalid password", document: false do
        do_request

        expect(response_status).to eq(422)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end
end
