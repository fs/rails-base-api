RSpec::Matchers.define :be_a_meta_representation_of do |posts, params|
  match do |json|
    params = params.stringify_keys

    expect(json).to be
    expect(json).to include("pagination")

    expect(json["pagination"]["page"]).to eq params["page"]
    expect(json["pagination"]["per_page"]).to eq params["per_page"]
    expect(json["pagination"]["total"]).to eq posts.size
  end
end
