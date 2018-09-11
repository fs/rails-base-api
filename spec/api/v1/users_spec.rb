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

    example "List Users" do
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/users")
    end
  end

  get "/v1/users/:id" do
    parameter :id, "user id", required: true

    let(:user) { create :user }
    let(:id) { user.id }
    let(:request_class) { "user_request" }

    example "Retrive User" do
      do_request

      expect(response_status).to eq(200)
      expect(response_body).to match_response_schema("v1/user")
    end

    context "with invalid id" do
      let(:id) { 0 }

      example "Retrive User with invalid id"do
        do_request

        expect(response_status).to eq(404)
        expect(response_body).to match_response_schema("v1/errors")
      end
    end
  end
end
