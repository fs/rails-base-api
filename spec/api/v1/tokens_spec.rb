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
    let(:request_class) { "token_request" }

    let(:email) { "user@example.com" }
    parameter :email, "email", required: true

    let(:password) { "123456" }
    parameter :password, "password", required: true

    include_context "with JSON API post body from request class"

    before do
      create :user, email: email, password: "123456"
    end

    example_request "Create Token" do
      expect(response_status).to eq(201)
      expect(response_body).to match_response_schema("jwt_token")
    end
  end
end
