require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_context "current user signed in"

  subject(:response) { json_response_body }

  put "api/v1/users/:id" do
    parameter :username, "Username"
    parameter :password, "Password", required: true

    let(:id) { current_user.id }
    let(:username) { Faker::Internet.email }
    let(:password) { current_user.password }

    example_request "Update current user email" do
      expect(response_status).to be 200
      expect(response).to be_a_user_representation(current_user)
      expect(current_user.reload.username).to eql(username)
    end
  end
end
