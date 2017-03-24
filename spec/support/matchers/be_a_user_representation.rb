RSpec::Matchers.define :be_a_user_representation do |user|
  match do |json|
    expect(json).to be
    expect(json["attributes"]["email"]).to eq(user.email)
  end
end
