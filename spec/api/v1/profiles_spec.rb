require "rails_helper"

resource "Profiles" do
  include_context "with JSON API Authorization header"

  let(:current_user) { create :user, email: "john.smith@example.com", full_name: "John Smith" }

  get "/v1/profile" do
    let(:expected_data) do
      {
        "data" => {
          "id" => current_user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "john.smith@example.com",
            "full_name" => "John Smith"
          }
        }
      }
    end

    it_behaves_like "API endpoint with authorization"

    example "Retrive Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end

  patch "/v1/profile" do
    with_options scope: %i[data attributes] do
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
        "data" => {
          "id" => current_user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "user_updated@example.com",
            "full_name" => "Updated Name"
          }
        }
      }
    end

    it_behaves_like "API endpoint with authorization"

    example "Update Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end

    context "with invalid data" do
      let(:password) { "" }
      let(:email) { "invalid" }

      let(:expected_data) do
        {
          "errors" => [
            {
              "detail" => "is too short (minimum is 6 characters)",
              "source" => {
                "pointer" => "/data/attributes/password"
              }
            },
            {
              "detail" => "is invalid",
              "source" => {
                "pointer" => "/data/attributes/email"
              }
            }
          ]
        }
      end

      example "Update Profile with empty password and invalid email" do
        do_request

        expect(response_status).to eq(422)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end

  delete "/v1/profile" do
    let(:expected_data) do
      {
        "data" => {
          "id" => current_user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "john.smith@example.com",
            "full_name" => "John Smith"
          }
        }
      }
    end

    it_behaves_like "API endpoint with authorization"

    example "Delete Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end
end
