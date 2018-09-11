require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Authorization" do
  include_context "with JSON API Headers"

  get "/v1/profile" do
    example "Request without authorization" do
      do_request

      expect(response_status).to eq 401
      expect(response_body).to match_response_schema("v1/errors")
    end
  end
end
