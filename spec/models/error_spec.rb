require "rails_helper"

describe Error do
  subject(:error) { described_class.new(code: :custom_error) }

  it "serializable resource" do
    expect { ActiveModelSerializers::SerializableResource.new(error).to_json }
      .not_to raise_error
  end

  it "creates error with custom_error code" do
    expect(error.code).to be(:custom_error)
    expect(error.status).to be(:internal_server_error)
    expect(error.detail).to eql("Custom error message")
  end
end
