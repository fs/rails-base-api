require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  patch "/users/:id" do
    let(:id) { current_user.id }
    let(:email) { Faker::Internet.email }

    parameter :id, "(integer) Current user's id", required: true
    parameter :email, "(string) New user's email", required: true

    let!(:params) { jsonapi_params("users", { email: email }, id) }

    context "with valid token" do
      example_request "Update user" do
        expect(response_status_code).to eq(:accepted)
        expect(response_attrs["email"]).to eq(email)
      end
    end

    context "with invalid token", document: false do
      before { header "X-User-Token", "" }

      example_request "Update user causes authorization error" do
        expect(response_status_code).to eq(:unauthorized)
      end
    end
  end
end
