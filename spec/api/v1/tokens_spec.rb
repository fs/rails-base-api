require "rails_helper"

class TokenRequest < ActiveModelSerializers::Model
  attributes :id, :email, :password
end

class TokenRequestSerializer < ApplicationSerializer
  attributes :email, :password
end

resource "Tokens" do
  include_context "with JSON API Headers"

  post "/v1/tokens" do
    parameter :email, "email", required: true
    parameter :password, "password", required: true

    let(:email) { "user@example.com" }
    let(:password) { "123456" }
    let(:request_class) { "token_request" }

    include_context "with JSON API post body from request class"

    before do
      create :user, email: email, password: "123456"
    end

    example_request "Create Token" do
      expect(response_status).to eq(201)
      expect(response_body).to match_response_schema("jwt_token")
    end

    context "with invalid password" do
      let(:password) { "invalid" }

      example "Create Token with invalid password", document: false do
        do_request
        expect(response_status).to eq(422)
        expect(response_body).to match_response_schema("error")
      end
    end
  end
end
