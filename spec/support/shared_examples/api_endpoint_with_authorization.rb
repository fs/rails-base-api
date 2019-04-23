shared_examples "API endpoint with authorization" do
  context "without authorization headers" do
    before do
      header "Authorization", ""
    end

    let(:expected_data) { { "error" => "unauthorized" } }

    example "Request without authorization header", document: false do
      do_request

      expect(response_status).to eq(401)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
