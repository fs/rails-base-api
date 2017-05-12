require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Sessions" do
  header "Accept", "application/json"

  subject(:response) { json_response_data }

  post "/api/v1/sessions" do
    let(:user) { create :user, password: "123456" }

    with_options scope: :session, reduired: true do
      parameter :email, "Email", required: true
      parameter :password, "Password", required: true
    end

    let(:session) { { email: user.email, password: user.password } }

    example "Sign in with valid password" do
      do_request(session: session)
      expect(response).to be_a_token_representation
    end

    example "Sign in with invalid password" do
      do_request(session: session.except(:password))
      expect(response_status).to eq 401
    end
  end
end
