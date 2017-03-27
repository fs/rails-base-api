require "rails_helper"
require "rspec_api_documentation/dsl"

resource "User" do
  subject(:response) { json_response_body }
  let(:current_user) { create(:user, :admin) }
  let(:token) { JWTWrapper.encode(JWTPayload.payload_for(current_user)) }

  before { header "Authorization", "Bearer #{token}" }

  get "api/v1/admins" do
    example_request "Admin user request for admins" do
      expect(response_status).to be 200
      expect(response["users"].first).to be_a_user_representation(current_user)
    end
  end
end
