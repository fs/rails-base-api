require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  subject(:response) { json_response_body }

  post "api/v1/users" do
    let(:user) { attributes_for(:user, password: "123456") }

    parameter :username, "Username", required: true
    parameter :password, "Password", required: true

    let(:username) { user[:username] }

    example_request "Registration with valid data", password: "123456" do
      expect(response_status).to be 201
    end

    example_request "Registration with invalid data", password: "" do
      expect(response_status).to be 422
      expect(response_body).to include("error")
    end
  end
end
