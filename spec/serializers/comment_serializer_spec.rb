require 'spec_helper'

describe CommentSerializer do
  let(:comment) { build :comment }
  let(:json) { ActiveModel::SerializableResource.serialize(comment).to_json }
  let(:comment_json) { parse_json(json)['comment'] }

  it 'returns comment' do
    expect(comment_json).to be_a_comment_representation(comment)
  end
end
