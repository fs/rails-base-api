RSpec::Matchers.define :be_a_token_representation do
  match do |json|
    response_attributes = %w(
      auth_token
      refresh_token
    )

    expect(json).to be
    expect(json.keys).to match_array(response_attributes)
  end
end
