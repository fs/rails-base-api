require 'spec_helper'

describe PostSerializer do
  let(:post) { FactoryGirl.build :post }
  let(:json) { PostSerializer.new(post).to_json }

  subject { JSON.parse(json) }

  it { should be_a_post_representation(post) }
end
