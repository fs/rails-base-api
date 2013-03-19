RSpec::Matchers.define :be_a_user_representation do |user|
  match do |json|
    response_attributes = user.sliced_attributes %w[
      id
      authentication_token
      email
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
