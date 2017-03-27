require "rails_helper"

describe Article do
  subject(:article) { described_class.new(attributes_for(:article)) }

  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:content) }

  it { is_expected.to be_valid }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
end
