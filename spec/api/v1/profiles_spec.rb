require "rails_helper"

resource "Profiles" do
  include_context "with Authorization header"

  let(:current_user) { create :user, email: "john.smith@example.com", full_name: "John Smith" }

  get "/v1/profile" do
    let(:expected_data) do
      {
        "id" => current_user.id,
        "email" => "john.smith@example.com",
        "full_name" => "John Smith"
      }
    end

    it_behaves_like "API endpoint with authorization"

    example_request "Retrieve Profile" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end

  patch "/v1/profile" do
    with_options scope: :user do
      parameter :full_name, "full name"
      parameter :email, "email"
      parameter :password, "password"
    end

    let(:id) { current_user.id }
    let(:type) { "users" }
    let(:full_name) { "Updated Name" }
    let(:email) { "user_updated@example.com" }
    let(:password) { "new_password" }

    let(:expected_data) do
      {
        "id" => current_user.id,
        "email" => "user_updated@example.com",
        "full_name" => "Updated Name"
      }
    end

    it_behaves_like "API endpoint with authorization"

    example_request "Update Profile" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end

    context "with invalid data" do
      let(:password) { "" }
      let(:email) { "invalid" }

      let(:expected_data) do
        {
          "error" => "Invalid record",
          "id" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
          "status" => 422,
          "validations" => {
            "email" => ["is invalid"],
            "password" => ["is too short (minimum is 6 characters)"]
          }
        }
      end

      example "Update Profile with empty password and invalid email", document: false do
        do_request

        expect(response_status).to eq(422)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end

  delete "/v1/profile" do
    let(:expected_data) do
      {
        "id" => current_user.id,
        "email" => "john.smith@example.com",
        "full_name" => "John Smith"
      }
    end

    it_behaves_like "API endpoint with authorization"

    example_request "Delete Profile" do
      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
