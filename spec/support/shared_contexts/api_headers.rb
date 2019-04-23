shared_context "with API Headers" do
  header "Accept", "application/json"
  header "Content-Type", "application/json"
  header "Lang", "en"

  let(:raw_post) { params.to_json }
end

shared_context "with Authorization header" do
  include_context "with API Headers"

  let(:current_user) { create(:user) }
  let(:jwt_token) { build(:jwt_token, subject: current_user) }
  let(:authorization) { "Bearer #{jwt_token.token}" }

  before do
    header "Authorization", :authorization
  end
end
