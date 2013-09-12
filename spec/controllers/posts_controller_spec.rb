require 'spec_helper'

describe PostsController do
  let(:post) { FactoryGirl.build(:post) }
  let(:posts) { [post] }

  before do
    posts.stub(:find) { post }
    Post.stub(:all) { posts }
  end

  describe 'GET #index' do
    before do
      get :index,
        format: :json
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'assigns posts' do
      expect(controller.posts).to match_array(posts)
    end
  end

  describe 'GET #show' do
    before do
      get :show,
        id: 1,
        format: :json
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'assigns post' do
      expect(controller.post).to eq(post)
    end
  end
end
