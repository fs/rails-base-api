shared_examples "API endpoint with authorization" do
  context "without authorization headers" do
    before do
      header "Authorization", ""
    end

    let(:expected_data) do
      {
        "errors" => [
          {
            "id" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
            "status" => 401,
            "error" => "Authorization required"
          }
        ]
      }
    end

    example "Request without authorization header", document: false do
      do_request

      expect(response_status).to eq(401)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
