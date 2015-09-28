require "rails_helper"

describe PaginatedArraySerializer do
  let(:pagination_params) { { per_page: 25, page: 1 } }
  let(:users) { Kaminari.paginate_array(build_list(:user, 3)).page(1) }
  let(:json) { ActiveModel::SerializableResource.serialize(users, serializer: PaginatedArraySerializer).to_json }
  let(:parsed_json) { parse_json(json) }

  it "returns json with meta" do
    expect(parsed_json).to have_key("meta")
    expect(parsed_json["meta"]).to be_a_meta_representation_of(users, pagination_params)
  end
end
