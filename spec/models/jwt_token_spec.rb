require "rails_helper"

describe JwtToken do
  subject(:jwt_token) { described_class.new(payload: { "sub" => "1" }) }

  it "serializable resource" do
    expect { ActiveModelSerializers::SerializableResource.new(jwt_token).as_json }
      .not_to raise_error
  end
end
