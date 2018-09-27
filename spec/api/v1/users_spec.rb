require "rails_helper"

class UserRequest < ActiveModelSerializers::Model
  attributes :id, :full_name, :email, :password
end

class UserRequestSerializer < ApplicationSerializer
  attributes :full_name, :email, :password
end

resource "Users" do
  include_context "with JSON API Authorization header"

  get "/v1/users" do
    let!(:current_user) { create :user, full_name: "John Smith", email: "john.smith@example.com" }
    let!(:user_1) { create :user, full_name: "Michael Jordan", email: "michael.jordan@example.com" }
    let!(:user_2) { create :user, full_name: "Brad Pitt", email: "brad.pitt@example.com" }
    let!(:user_3) { create :user, full_name: "Steve Jobs", email: "steve.jobs@example.com" }

    let(:expected_data) do
      {
        "data" => [{
          "id" => current_user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "john.smith@example.com",
            "full_name" => "John Smith"
          }
        }, {
          "id" => user_1.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "michael.jordan@example.com",
            "full_name" => "Michael Jordan"
          }
        }, {
          "id" => user_2.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "brad.pitt@example.com",
            "full_name" => "Brad Pitt"
          }
        }, {
          "id" => user_3.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "steve.jobs@example.com",
            "full_name" => "Steve Jobs"
          }
        }]
      }
    end

    it_behaves_like "API endpoint with authorization"

    example "List Users" do
      do_request

      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end
  end

  get "/v1/users/:id" do
    parameter :id, "user id", required: true

    let(:user) { create :user, full_name: "John Smith", email: "john.smith@example.com" }
    let(:id) { user.id }

    let(:expected_data) do
      {
        "data" => {
          "id" => user.id.to_s,
          "type" => "users",
          "attributes" => {
            "email" => "john.smith@example.com",
            "full_name" => "John Smith"
          }
        }
      }
    end

    it_behaves_like "API endpoint with authorization"

    example "Retrive User" do
      do_request

      expect(response_status).to eq(200)
      expect(json_response_body).to eq(expected_data)
    end

    context "with invalid id" do
      let(:id) { 0 }

      let(:expected_data) do
        {
          "errors" => [{
            "code" => "record_not_found",
            "detail" => "Record not found"
          }]
        }
      end

      example "Retrive User with invalid id" do
        do_request

        expect(response_status).to eq(404)
        expect(json_response_body).to eq(expected_data)
      end
    end
  end
end
