require "rails_helper"

class UserRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class UserRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "Users" do
  include_context "with JSON API Headers"
  include_context "with JSON API post body from request class"

  get "/v1/users" do
    include_context "with JSON API Authorization header"

    let(:request_class) { "user_request" }

    before do
      create_list :user, 3
    end

    example_request "List Users" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("users")
    end
  end

  get "/v1/users/:id" do
    include_context "with JSON API Authorization header"

    parameter :id, "user id", required: true

    let(:user) { create :user }
    let(:id) { user.id }
    let(:request_class) { "user_request" }

    example_request "Retrive User" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("user")
    end

    context "with invalid id" do
      let(:id) { 332 }

      example "Retrive User with invalid id", document: false do
        do_request
        expect(response_status).to eq(404)
        expect(response_body).to match_response_schema("error")
      end
    end
  end

  post "/v1/users" do
    parameter :full_name, "full name"
    parameter :email, "email", required: true
    parameter :password, "password", required: true

    let(:full_name) { "Example User" }
    let(:email) { "user@example.com" }
    let(:password) { "123456" }
    let(:request_class) { "user_request" }

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

    context "when user already exists" do
      before do
        create :user, email: email
      end

      example "Create User with existing email", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end
  end
end
