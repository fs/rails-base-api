require 'spec_helper'

describe PostCommentsController do
  describe 'GET #index' do
    let(:comments) { FactoryGirl.build_list(:comment, 2) }

    before do
      Post.should_receive(:find) { double(comments: double(scoped: comments)) }

      get :index,
        post_id: '1',
        format: :json
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.code).to eq('200')
    end

    it 'assigns comments' do
      expect(controller.comments).to match_array(comments)
    end
  end
end
