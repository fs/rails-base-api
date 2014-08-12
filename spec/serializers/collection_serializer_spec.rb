require 'rails_helper'

describe CollectionSerializer do
  let(:collection) { [1, 2, 3] }

  let(:serialized_collection) { CollectionSerializer.new(collection) }
  let(:serialized_object) { serialized_collection.object }
  let(:serialized_meta) { serialized_collection.options[:meta] }

  let(:meta) do
    {
      pagination:
      {
        total: 3,
        per_page: 25,
        page: 1
      }
    }
  end

  before do
    allow(collection).to receive_messages(
      total_count: 3,
      limit_value: 25,
      current_page: 1
    )
  end

  it 'returns collection with meta' do
    expect(serialized_object).to eql(collection)
    expect(serialized_meta).to be_a_meta_representation(meta)
  end
end
