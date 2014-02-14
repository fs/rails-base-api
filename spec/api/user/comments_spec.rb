require 'spec_helper'

describe 'comments API' do
  let!(:user) { create :user }
  let!(:comment) { create :comment, user: user }
  let(:auth_header) { { 'X-AUTH-TOKEN' => user.authentication_token } }
  let(:comment_params) { { title: 'Title', text: 'Text' } }

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

      it 'returns comments list' do
        comments_json = json_response_body

        expect(comments_json).to be_a_kind_of Array
        expect(comments_json.first).to be_a_comment_representation(comment)
      end
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

      it 'returns comment' do
        expect(json_response_body).to be_a_comment_representation(user.comments.last)
      end
    end
  end
end
