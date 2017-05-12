require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_context "current user signed in"

  delete "api/v1/users/:id" do
    let(:id) { current_user.id }

    example_request "Delete current user" do
      expect(response_status).to be 204
    end
  end
end
