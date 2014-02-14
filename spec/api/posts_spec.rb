require 'spec_helper'

describe '/posts' do
  describe 'list posts' do
    let!(:post) { FactoryGirl.create :post }
    let!(:comment) { FactoryGirl.create :comment, post: post }

    before do
      get '/posts.json'
    end

    it 'returns posts list' do
      posts_json = json_response_body

      expect(posts_json).to be_a_kind_of Array
      expect(posts_json.first).to be_a_post_representation(post)
    end
  end

  describe 'show post' do
    let!(:post) { FactoryGirl.create :post }

    before do
      get "/posts/#{post.id}.json"
    end

    it 'returns post' do
      expect(json_response_body).to be_a_post_representation(post)
    end
  end
end
