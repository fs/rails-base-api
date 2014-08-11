RSpec::Matchers.define :be_a_meta_representation do |meta|
  match do |json|
    expect(json).to be
    expect(json).to eql(meta)
  end
end
