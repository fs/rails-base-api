RSpec::Matchers.define :be_an_error_representation do |status, message|
  match do |json|
    expect(json).to be
    expect(json["status"].to_i).to eq(status.to_i)
    expect(json["error"]).to eq(message)
  end
end
