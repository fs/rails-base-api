require "rails_helper"

class ProfileRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class ProfileRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "Profiles" do
  include_context "with JSON API Headers"
  include_context "with JSON API Authorization header"
  include_context "with JSON API post body from request class"

  get "/v1/profile" do
    let(:request_class) { "profile_request" }

    example "Retrive Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/users")
    end
  end

  patch "/v1/profile" do
    parameter :full_name, "full name"
    parameter :email, "email"
    parameter :password, "password"

    let(:full_name) { "Example User Updated" }
    let(:email) { "user_updated@example.com" }
    let(:password) { "new_password" }
    let(:request_class) { "profile_request" }

    example "Update Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/user")
    end

    context "with invalid data" do
      let(:password) { "" }
      let(:email) { "invalid" }

      example "Update Profile with empty password and invalid email" do
        do_request

        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("v1/errors")
      end
    end
  end

  delete "/v1/profile" do
    let(:request_class) { "profile_request" }

    example "Delete Profile" do
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/user")
    end
  end
end
