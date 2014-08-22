require 'spec_helper'

describe V1::User::CommentsController do
  before do
    sign_in(create :user)
  end

  describe '#index' do
    let(:comments) { build_list :comment, 2 }

    before do
      allow(comments).to receive_messages(total_count: 1, limit_value: 1, current_page: 1)
      allow(Comment).to receive_message_chain(:page, :per, :with_posts_and_users).and_return(comments)

      get :index, format: :json
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
      post :create, format: :json, comment: { title: 'Title', text: 'Text' }
    end

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end
  end
end
