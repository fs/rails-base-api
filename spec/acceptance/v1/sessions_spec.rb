require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Sessions" do
  include_examples "JSON API headers"

  subject(:response) { json_response_body }

  let!(:user) { create :user, password: "123456" }
  let(:attributes) { { email: user.email, password: "123456" } }

  post "/sessions" do
    let(:user) { create :user, password: "123456" }

    with_options required: true do
      parameter :email, "Email", required: true
      parameter :password, "Password", required: true
    end

    context "with valid password" do
      let(:params) { jsonapi_params "sessions", attributes }

      example_request "Successfull sign in" do
        expect(response_status_code).to eq(:created)
        expect(response_attrs).to be_a_session_representation
      end
    end

    context "with invalid password" do
      let(:params) { jsonapi_params "sessions", email: user.email }

      example_request "Failed sign in" do
        expect(response_status_code).to eq(:unauthorized)
      end
    end
  end
end
