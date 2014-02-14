require 'spec_helper'

describe 'comments API' do
  let!(:user) { create :user }
  let!(:comment) { create :comment, user: user }
  let(:auth_header) { { 'X-AUTH-TOKEN' => user.authentication_token } }
  let(:comment_params) { { title: 'Title', text: 'Text' } }

  subject { json_response_body }

  describe 'GET /user/comments.json' do
    context 'without authentication token' do
      before do
        get '/user/comments.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end

    context 'with authentication token' do
      before do
        get '/user/comments.json', {}, auth_header
      end

      it { should be_a_kind_of Array }
      its(:first) { should be_a_comment_representation(comment) }
    end
  end

  describe 'POST /user/comments.json' do
    context 'without authentication token' do
      before do
        post '/user/comments.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end

    context 'with authentication token' do
      before do
        post '/user/comments.json', comment_params, auth_header
      end

      it { should be_a_comment_representation(user.comments.last) }
    end
  end
end
