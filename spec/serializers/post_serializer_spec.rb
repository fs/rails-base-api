require 'spec_helper'

describe PostSerializer do
  let(:post) { build :post }
  let(:json) { ActiveModel::SerializableResource.serialize(post).to_json }
  let(:post_json) { parse_json(json)['post'] }

  it 'returns post' do
    expect(post_json).to be_a_post_representation(post)
  end
end
