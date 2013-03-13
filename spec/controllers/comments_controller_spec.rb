require 'spec_helper'

describe CommentsController do
  let(:comment) { FactoryGirl.build(:comment) }
  let(:comments) { [comment] }

  before do
    comments.stub(:find) { comment }
    Comment.stub(:scoped) { comments }
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

    it 'assigns comments' do
      expect(controller.comments).to match_array(comments)
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
      expect(controller.comment).to eq(comment)
    end
  end

end
