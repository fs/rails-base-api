require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  get "/users/:id" do
    let(:id) { current_user.id }

    parameter :id, "(integer) Current user's id", required: true

    example_request "Show user profile" do
      expect(response_status_code).to eq(:ok)
      expect(response_data).to be_a_user_representation(current_user)
    end
  end
end
