require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  post "/users/" do
    let(:email) { Faker::Internet.email }
    let(:password) { "123456" }
    let(:user) { build :user, email: email, password: password }

    parameter :email, "(string) New user's email", required: true
    parameter :password, "(string) New user's password", required: true

    context "with valid data" do
      let(:params) { jsonapi_params "users", email: email, password: password }

      example_request "Register user" do
        expect(response_status_code).to eq(:created)
        expect(response_data).to be_a_user_representation(user)
      end
    end

    context "with invalid data" do
      let(:params) { jsonapi_params "users", email: email }

      example_request "Register user with invalid data" do
        expect(response_status_code).to eq(:unprocessable_entity)
      end
    end
  end
end
