require 'spec_helper'

describe CommentSerializer do
  let(:comment) { FactoryGirl.build :comment }
  let(:json) { CommentSerializer.new(comment).to_json }
  let(:comment_json) { parse_json(json) }

  it 'returns comment' do
    expect(comment_json).to be_a_comment_representation(comment)
  end
end
