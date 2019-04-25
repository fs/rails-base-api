require "rails_helper"

resource "Registration" do
  include_context "with API Headers"

  post "/v1/registrations" do
    with_options scope: :user do
      parameter :full_name, "full name"
      parameter :email, "email", required: true
      parameter :password, "password", required: true
    end

    let(:user) { User.find_by(email: email) }
    let(:full_name) { "Example User" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }

    let(:expected_data) do
      {
        "id" => user.id,
        "email" => "user@example.com",
        "full_name" => "Example User"
      }
    end

    example_request "Create User" do
      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
