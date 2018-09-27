shared_context "with JSON API Headers" do
  header "Content-Type", "application/vnd.api+json"
  header "Accept", "application/vnd.api+json"

  let(:raw_post) { params.to_json }
end

shared_context "with JSON API Authorization header" do
  include_context "with JSON API Headers"

  let(:current_user) { create(:user) }
  let(:jwt_token) { build(:jwt_token, subject: current_user) }
  let(:authorization) { "Bearer #{jwt_token.token}" }

  before do
    header "Authorization", :authorization
  end
end
