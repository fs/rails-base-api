RSpec::Matchers.define :be_a_meta_representation do |expected|
  match do |meta|
    expect(meta).to be
    expect(meta).to eql(expected)
  end
end
