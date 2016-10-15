shared_context "user signed in" do
  let(:current_user) { create :user }

  before do
    header "X-User-Token", current_user.authentication_token
    header "X-User-Email", current_user.email
  end
end
