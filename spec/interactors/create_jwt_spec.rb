require "rails_helper"

describe CreateJwt do
  let(:interactor) { described_class.new(user_attributes) }
  let(:context) { interactor.context }

  let(:user_attributes) { attributes_for(:user).slice(:email, :password) }

  context "when user does not exist" do
    it_behaves_like "failure interactor"
  end

  context "when user exists" do
    before do
      create(:user, user_attributes)
    end

    it_behaves_like "success interactor"

    it "sets token in context" do
      interactor.run
      expect(context.jwt_token).to be_present
    end
  end
end
