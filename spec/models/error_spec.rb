require "rails_helper"

describe Error do
  subject(:error) { described_class.new(code: :custom_error) }

  it "serializable resource" do
    expect { ActiveModelSerializers::SerializableResource.new(error).to_json }
      .not_to raise_error
  end

  its(:code) { is_expected.to be(:custom_error) }
  its(:status) { is_expected.to be(:internal_server_error) }
  its(:detail) { is_expected.to eql("Custom error message") }
end
