require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  delete "/users/:id" do
    let(:id) { current_user.id }

    parameter :id, "(integer) Current user's id", required: true

    context "with valid token" do
      example_request "Remove user" do
        expect(response_status_code).to eq(:no_content)
      end
    end

    context "with invalid token", document: false do
      before { header "X-User-Token", "" }

      example_request "Removal user causes authorization error" do
        expect(response_status_code).to eq(:unauthorized)
      end
    end
  end
end
