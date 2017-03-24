require "rails_helper"
require "rspec_api_documentation/dsl"

resource "TodoItems" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  post "/todo-items/" do
    let(:title) { Faker::Hipster.sentence }
    let(:text) { Faker::Hipster.paragraph }
    let(:status) { 0 }
    let(:item) { build :todo_item, title: title, text: text, status: status }

    parameter :title, "(string) Item's title", required: true
    parameter :text, "(string) Todo item content"
    parameter :status, "(0|1) Item status - created or completed"

    context "with valid data" do
      let(:params) do
        jsonapi_params "todo_items", item.attributes.slice("title", "text", "status")
      end

      example_request "Create todo item" do
        expect(response_status_code).to eq(:created)
        expect(response_data).to be_a_todo_item_representation(item)
      end
    end

    context "with invalid data" do
      let(:params) { jsonapi_params "todo_items", text: text }

      example_request "Failed to create todo item" do
        expect(response_status_code).to eq(:unprocessable_entity)
      end
    end
  end
end
