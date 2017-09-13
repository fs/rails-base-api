require "rails_helper"

describe PaginatedArraySerializer do
  let(:users) { Kaminari.paginate_array(build_list(:user, 3)).page(1) }
  let(:json) { ActiveModel::SerializableResource.serialize(users, serializer: PaginatedArraySerializer).to_json }
  let(:parsed_json) { parse_json(json) }

  it "returns json with meta" do
    expect(parsed_json).to include("meta")
  end

  it "returns meta with pagination info" do
    expect(parsed_json["meta"]).to include("pagination")

    expect(parsed_json["meta"]["pagination"]["total"]).to eq 3
    expect(parsed_json["meta"]["pagination"]["per_page"]).to eq 25
    expect(parsed_json["meta"]["pagination"]["page"]).to eq 1
  end
end
