require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Errors" do
  header "Accept", "application/json"
  subject(:response) { json_response_body }

  get "/not-found" do
    example_request "Request to unexisting page" do
      expect(response_status_code).to eq(:not_found)
      expect(response).to be_an_error_representation(404, "Not Found")
    end
  end
end
