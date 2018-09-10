require "rails_helper"

class SignUpRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class SignUpRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "SignUp" do
  include_context "with JSON API Headers"
  include_context "with JSON API post body from request class"

  post "/v1/sign_ups" do
    parameter :full_name, "full name"
    parameter :email, "email", required: true
    parameter :password, "password", required: true

    let(:full_name) { "Example User" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }
    let(:request_class) { "user_request" }

    example_request "Create User" do
      expect(response_status).to eq(201)
      expect(response_body).to match_response_schema("v1/user")
    end

    context "with invalid email" do
      let(:email) { "invalid" }

      example "Create User with invalid email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("v1/error")
      end
    end

    context "with blank password" do
      let(:password) { "" }

      example "Create User with invalid password", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("v1/error")
      end
    end

    context "when user already exists" do
      before do
        create :user, email: email
      end

      example "Create User with existing email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("v1/error")
      end
    end
  end
end
