require "rails_helper"

class UserRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class UserRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "Users" do
  include_context "with JSON API Headers"
  include_context "with JSON API Authorization header"
  include_context "with JSON API post body from request class"

  get "/v1/users" do
    let(:request_class) { "user_request" }

    before do
      create_list :user, 3
    end

    example_request "List Users" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/users")
    end
  end

  get "/v1/users/:id" do
    parameter :id, "user id", required: true

    let(:user) { create :user }
    let(:id) { user.id }
    let(:request_class) { "user_request" }

    example_request "Retrive User" do
      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/user")
    end

    context "with invalid id" do
      let(:id) { 332 }

      example "Retrive User with invalid id", document: false do
        do_request
        expect(response_status).to eq(404)
        expect(response_body).to match_response_schema("v1/error")
      end
    end
  end
end
