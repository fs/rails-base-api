require "rails_helper"

class UserRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class UserRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "Users" do
  include_context "with JSON API Headers"

  post "/v1/users" do
    parameter :full_name, "full name"
    parameter :email, "email", required: true
    parameter :password, "password", required: true

    let(:full_name) { "Example User" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }
    let(:request_class) { "user_request" }

    include_context "with JSON API post body from request class"

    example_request "Create User" do
      expect(response_status).to eq(201)
      expect(response_body).to match_response_schema("user")
    end

    context "with invalid email" do
      let(:email) { "invalid" }

      example "Create User with invalid email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end

    context "with blank password" do
      let(:password) { "" }

      example "Create User with invalid password", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end
  end
end
