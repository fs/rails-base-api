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

    example_request "Retrive Profile" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("users")
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

    example_request "Update Profile" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("user")
    end

    context "with invalid email" do
      let(:email) { "invalid" }

      example "Update Profile with invalid email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end

    context "with short password" do
      let(:password) { "short" }

      example "Update Profile with invalid email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end

    context "when user already exists" do
      before do
        create :user, email: email
      end

      example "Update Profile with existing email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end
  end

  delete "/v1/profile" do
    let(:request_class) { "profile_request" }

    example_request "Delete Profile" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("user")
    end
  end
end
