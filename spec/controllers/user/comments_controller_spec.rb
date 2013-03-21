require 'spec_helper'

describe User::CommentsController do
  before do
    sign_in(FactoryGirl.create(:user))
  end

  describe '#index' do
    let(:comments) { FactoryGirl.build_list :comment, 2 }

    before do
      controller.current_user.stub(:comments) { double(scoped: comments) }

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

  describe '#create' do
    before do
      post :create,
        format: :json,
        title: 'Title',
        text: 'Text'
    end

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end
  end
end
