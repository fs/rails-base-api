require "rails_helper"

describe Error do
  subject(:error) { described_class.new(code: :custom_error, validations: validations) }

  let(:validations) { nil }

  it "serializable resource" do
    expect { ActiveModelSerializers::SerializableResource.new(error).to_json }.not_to raise_error
  end

  describe "#attributes" do
    subject { error.attributes }

    let(:expected_attributes) do
      {
        "id" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
        "status" => 500,
        "error" => "Custom error message",
        "validations" => nil
      }
    end

    it { is_expected.to eq(expected_attributes) }

    context "with validation errors" do
      let(:validations) { { email: ["can't be blank", "is invalid"] } }

      let(:expected_attributes) do
        {
          "id" => "4eac02e2-6856-449b-bc28-fbf1b32a20f2",
          "status" => 500,
          "error" => "Custom error message",
          "validations" => {
            "email" => ["can't be blank", "is invalid"]
          }
        }
      end

      it { is_expected.to eq(expected_attributes) }
    end
  end
end
