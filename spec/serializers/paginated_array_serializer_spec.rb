describe PaginatedArraySerializer do
  let(:collection) { Kaminari.paginate_array([1, 2, 3]).page(1) }
  let(:json) { PaginatedArraySerializer.new(collection, root: :collection).to_json }
  let(:parsed_json) { parse_json(json) }

  it 'returns json with meta' do
    expect(parsed_json).to include('meta')
  end

  it 'returns meta with pagination info' do
    expect(parsed_json['meta']).to include('pagination')

    expect(parsed_json['meta']['pagination']['total']).to eq 3
    expect(parsed_json['meta']['pagination']['per_page']).to eq 25
    expect(parsed_json['meta']['pagination']['page']).to eq 1
  end
end
