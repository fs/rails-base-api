require "rails_helper"
require "rspec_api_documentation/dsl"

resource "TodoItems" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }
  let!(:item) { create :todo_item, user: current_user }

  patch "/todo-items/:id" do
    let(:id) { item.id }
    let(:title) { Faker::Hipster.sentence }
    let(:text) { Faker::Hipster.paragraph }
    let(:status) { 1 }

    let(:updated_item) { build :todo_item, title: title, text: text, status: status }

    parameter :title, "(string) Item's title", required: true
    parameter :text, "(string) Todo item content"
    parameter :status, "(0|1) Item status - created or completed"

    let!(:params) do
      jsonapi_params "todo_items",
      updated_item.attributes.slice("title", "text", "status"),
      id
    end

    context "with valid token" do
      example_request "Updates todo item" do
        expect(response_status_code).to eq(:accepted)
        expect(response_data).to be_a_todo_item_representation(updated_item)
        expect(response_data).not_to be_a_todo_item_representation(item)
      end
    end

    context "with invalid token", document: false do
      before { header "X-User-Token", "" }

      example_request "Update causes authorization error" do
        expect(response_status_code).to eq(:unauthorized)
      end
    end
  end
end
