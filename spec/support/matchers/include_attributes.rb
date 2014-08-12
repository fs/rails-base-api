RSpec::Matchers.define :include_attributes do |expected|
  match do |actual|
    expect(actual).to RSpec::Matchers::BuiltIn::Include.new(expected.as_json)
  end
end
