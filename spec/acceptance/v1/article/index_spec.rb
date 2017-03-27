require "rails_helper"
require "rspec_api_documentation/dsl"

resource "Article" do
  subject(:response) { json_response_body }

  get "api/v1/articles" do
    let!(:article) { create :article }

    example_request "Get articles" do
      expect(response_status).to be 200
      expect(response["articles"].first).to be_a_article_representation(article)
    end
  end
end
