RSpec::Matchers.define :include_attributes do |expected|
  match_for_should do |actual|
    actual.should RSpec::Matchers::BuiltIn::Include.new(expected.as_json)
  end
end
