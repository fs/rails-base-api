require 'spec_helper'

describe 'GET /user/comments.json' do
  describe  "list user's comments" do
    context 'without authentication token' do
      before do
        get '/user/comments.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end

    context 'with authentication token' do
      let!(:user) { FactoryGirl.create :user }
      let!(:comment) { FactoryGirl.create :comment, user: user }

      before do
        get '/user/comments.json',
          authentication_token: user.authentication_token
      end

      subject { json_response_body }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_comment_representation(comment) }
    end
  end

  describe 'create comment' do
    context 'without authentication token' do
      before do
        post '/user/comments.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end

    context 'with authentication token' do
      let!(:user) { FactoryGirl.create :user }

      before do
        post '/user/comments.json',
          authentication_token: user.authentication_token,
          title: 'Title',
          text: 'Text'
      end

      subject { json_response_body }
      it { should be_a_comment_representation(user.comments.last) }
    end
  end
end
