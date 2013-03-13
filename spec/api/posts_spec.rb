require 'spec_helper'

describe '/posts' do
  describe 'list posts' do
    let!(:post) { FactoryGirl.create :post }
    let!(:comment) { FactoryGirl.create :comment, post: post }

    before do
      get '/posts.json'
    end

    subject(:json) { json_response_body }

    describe 'posts collection' do
      subject { json['posts'] }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_post_representation(post) }
    end

    describe 'comments collection' do
      subject { json['comments'] }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_comment_representation(comment) }
    end
  end

  describe 'show post' do
    let!(:post) { FactoryGirl.create :post }

    before do
      get "/posts/#{post.id}.json"
    end

    subject(:json) { json_response_body }

    describe 'post item' do
      subject { json['post'] }
      it { should be_a_post_representation(post) }
    end
  end
end
