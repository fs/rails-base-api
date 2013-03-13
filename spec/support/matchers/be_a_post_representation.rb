RSpec::Matchers.define :be_a_post_representation do |post|
  match do |json|
    response_attributes = post.sliced_attributes %w[
      id
      title
      text
      comment_ids
    ]

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
