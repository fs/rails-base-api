RSpec::Matchers.define :be_a_user_representation do |user|
  match do |json|
    response_attributes = user.attributes.slice %w(
      id
      username
      role
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
