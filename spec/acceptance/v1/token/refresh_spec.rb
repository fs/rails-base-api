require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Tokens" do
  include_context "generate token object"

  before { header "Authorization", "Bearer #{token.refresh_token}" }

  subject(:response) { json_response_body }

  get "api/v1/tokens/refresh" do
    example_request "Update auth token" do
      expect(response_status).to be 200
      expect(response["token"]).to be_a_token_representation(token)
    end
  end
end
