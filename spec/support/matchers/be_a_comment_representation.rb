RSpec::Matchers.define :be_a_comment_representation do |comment|
  match do |json|
    response_attributes = comment.sliced_attributes %w[
      id
      title
      text
      post_id
    ]

    json.should be
    json.should include_attributes(response_attributes)
  end
end
