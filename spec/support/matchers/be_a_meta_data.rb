RSpec::Matchers.define :be_a_meta_data do |meta_data|
  match do |json|
    expect(json).to be
    expect(json).to include_attributes(meta_data)
  end
end
