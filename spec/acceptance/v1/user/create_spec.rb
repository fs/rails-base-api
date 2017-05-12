require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  subject(:response) { json_response_body }

  post "api/v1/users" do
    let(:user) { attributes_for(:user, password: "123456") }

    with_options scope: :user, required: true do
      parameter :email, "Email"
      parameter :password, "Password"
    end

    example "Registration with valid data" do
      do_request(user: user)
      expect(response_status).to be 201
    end

    example "Registration with invalid data" do
      do_request(user: user.except(:password))
      expect(response_status).to be 422
      expect(response_body).to include("error")
    end
  end
end
