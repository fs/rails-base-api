require 'spec_helper'

describe PostSerializer do
  let(:post) { FactoryGirl.build :post }
  let(:json) { PostSerializer.new(post).to_json }
  let(:post_json) { parse_json(json) }

  it 'returns post' do
    expect(post_json).to be_a_post_representation(post)
  end
end
