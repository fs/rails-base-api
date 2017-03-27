require "rails_helper"
require "rspec_api_documentation/dsl"

resource "User" do
  include_context "current user signed in"

  subject(:response) { json_response_body }

  get "api/v1/users" do
    example_request "Get users" do
      expect(response_status).to be 200
      expect(response["users"].first).to be_a_user_representation(current_user)
    end
  end
end
