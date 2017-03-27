require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Sessions" do
  header "Accept", "application/json"

  subject(:response) { json_response_body }

  post "/api/v1/sessions" do
    let(:user) { create :user, password: "123456" }

    parameter :username, "Username", required: true
    parameter :password, "Password", required: true
    parameter :code, "Code"

    let(:username) { user.username }

    example_request "Sign in with valid password", password: "123456" do
      expect(response["token"]).to be_a_token_representation
    end

    example_request "Sign in with invalid password", password: "" do
      expect(response_status).to eq 401
    end
  end
end
