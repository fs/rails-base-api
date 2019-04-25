require "rails_helper"

describe ErrorSerializer do
  describe "#serialize" do
    subject { ActiveModelSerializers::SerializableResource.new(error, serializer: described_class).as_json }

    let(:error) { build :error }
    let(:expected_attributes) do
      {
        id: "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
        status: 500,
        error: "Custom error message"
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context "with validations" do
      let(:error) { build :error, :with_validations }
      let(:expected_attributes) do
        {
          id: "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
          status: 500,
          error: "Custom error message",
          validations: {
            email: ["can't be blank", "is invalid"]
          }
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end
end
