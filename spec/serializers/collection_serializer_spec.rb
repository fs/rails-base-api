require 'rails_helper'

describe CollectionSerializer do
  let(:collection) { Kaminari.paginate_array([1, 2, 3]).page(1) }
  let(:serialized_collection) { CollectionSerializer.new(collection, root: :collection).as_json }

  it 'returns collection with meta' do
    expect(serialized_collection).to eql(
      collection: [1, 2, 3],
      meta: {
        pagination: {
          total: 3,
          per_page: 25,
          page: 1
        }
      }
    )
  end
end
