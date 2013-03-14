require 'spec_helper'

describe '/posts/:post_id/comments' do
  describe 'list comments for a post' do
    let!(:post) { FactoryGirl.create :post }
    let!(:comment) { FactoryGirl.create :comment, post: post }

    before do
      get "/posts/#{post.id}/comments.json"
    end

    subject(:json) { json_response_body }

    describe 'comments collection' do
      subject { json['comments'] }

      it { should be_a_kind_of(Array) }
      its(:first) { should be_a_comment_representation(comment) }
    end
  end
end
