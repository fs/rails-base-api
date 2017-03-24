require "rails_helper"
require "rspec_api_documentation/dsl"

resource "TodoItems" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }
  let(:todo_item) { create :todo_item, user: current_user }

  get "/todo-items/:id" do
    let(:id) { todo_item.id }

    parameter :id, "(integer) Todo Item's id", required: true

    example_request "Show todo item" do
      expect(response_status_code).to eq(:ok)
      expect(response_data).to be_a_todo_item_representation(todo_item)
    end
  end
end
