RSpec::Matchers.define :be_a_post_representation do |user|
  match do |json|
    response_attributes = post.sliced_attributes %w[
      id
      title
      text
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
