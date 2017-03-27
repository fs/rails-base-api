RSpec::Matchers.define :be_a_article_representation do |article|
  match do |json|
    response_attributes = article.attributes.slice %w(
      id
      title
      content
    )

    expect(json).to be
    expect(json).to include_attributes(response_attributes)
  end
end
