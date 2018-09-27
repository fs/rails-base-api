require "rails_helper"

resource "Registration" do
  include_context "with JSON API Headers"

  post "/v1/registrations" do
    with_options scope: %i[data attributes] do
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
        "data" => {
          "id" => user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "user@example.com",
            "full_name" => "Example User"
          }
        }
      }
    end

    example "Create User" do
      do_request

      expect(response_status).to eq(201)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
