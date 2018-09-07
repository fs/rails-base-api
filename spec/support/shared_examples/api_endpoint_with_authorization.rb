# rubocop:disable RSpec/EmptyExampleGroup
shared_examples "API endpoint with authorization" do
  context "without authorization headers", document: false do
    header "Authorization", ""

    example_request "Request without authorization header" do
      expect(response_status).to eq(401)
      expect(response_body).to match_response_schema("error")
    end
  end
end
# rubocop:enable RSpec/EmptyExampleGroup
