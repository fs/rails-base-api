require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"

  subject(:response) { json_response_body }

  let!(:user) { create :user }

  get "/users" do
    example_request "Show all users" do
      expect(response_status_code).to eq(:ok)
      expect(response_data.first).to be_a_user_representation(user)
    end
  end
end
