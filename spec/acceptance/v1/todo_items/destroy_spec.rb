require "rails_helper"
require "rspec_api_documentation/dsl"

resource "TodoItems" do
  include_examples "JSON API headers"
  include_context "user signed in"

  subject(:response) { json_response_body }

  let(:todo_item) { create :todo_item, user: current_user }
  let(:stranger) { create :user }

  delete "/todo-items/:id" do
    let(:id) { todo_item.id }

    parameter :id, "(integer) Todo Item's id", required: true

    context "with valid token" do
      example_request "Remove user" do
        expect(response_status_code).to eq(:ok)
        expect(response_data).to be_a_todo_item_representation(todo_item)
      end
    end

    context "with invalid token", document: false do
      before do
        header "X-User-Token", stranger.authentication_token
        header "X-User-Email", stranger.email
      end

      example_request "Removal user causes authorization error" do
        expect(response_status_code).to eq(:unauthorized)
      end
    end
  end
end
