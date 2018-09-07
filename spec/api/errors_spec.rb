require "rails_helper"

resource "Errors" do
  include_context "with JSON API Headers"

  # get "/not-found" do
  #   example_request "Request to unexisting page" do
  #     expect(response_status).to eq(404)
  #     expect(response_body).to match_response_schema("error")
  #   end
  # end
end
