require 'spec_helper'

describe '/api/v1/posts' do
  describe 'list posts' do
    let!(:post) { FactoryGirl.create :post }
    let!(:comment) { FactoryGirl.create :comment, post: post }

    before do
      get '/api/v1/posts'
    end

    subject { json_response_body }

    it { should be_a_kind_of Array }
    its(:first) { should be_a_post_representation(post) }
  end

  describe 'show post' do
    let!(:post) { FactoryGirl.create :post }

    before do
      get "/api/v1/posts/#{post.id}"
    end

    subject { json_response_body }
    it { should be_a_post_representation(post) }
  end
end
