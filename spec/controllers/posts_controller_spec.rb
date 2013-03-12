require 'spec_helper'

describe PostsController do
  let(:posts) { FactoryGirl.build_list(Post, 2) }

  before do
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

    it 'assigns users' do
      expect(controller.posts).to match_array(posts)
    end
  end
end
