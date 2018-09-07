shared_context "with JSON API Headers" do
  header "Content-Type", "application/vnd.api+json"
  header "Accept", "application/vnd.api+json"
end

shared_context "with JSON API Authorization header" do
  let(:current_user) { create(:user) }
  let(:jwt_token) { build(:jwt_token, subject: current_user) }
  let(:authorization) { "Bearer #{jwt_token.token}" }

  header "Authorization", :authorization
end

shared_context "with JSON API post body from request class" do
  let(:request_resource) { request_class.classify.constantize.new(params) }
  let(:raw_post) { ActiveModelSerializers::SerializableResource.new(request_resource).to_json }
end
