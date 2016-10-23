require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Users" do
  include_examples "JSON API headers"
  include_examples "user signed in"

  subject(:response) { json_response_body }
  let!(:todo_item) { create :todo_item, user: current_user }

  get "/todo-items" do
    example_request "Show all todo items of current user" do
      expect(response_status_code).to eq(:ok)
      expect(response_data.size).to eq(1)
      expect(response_data.first).to be_a_todo_item_representation(todo_item)
    end
  end
end
