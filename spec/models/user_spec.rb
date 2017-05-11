require "rails_helper"

describe User do
  subject(:user) { described_class.new(attributes_for(:user)) }

  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:email) }
end
