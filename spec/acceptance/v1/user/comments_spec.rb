require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let!(:user) { create :user }
  let!(:comments) { create_list :comment, 2, user: user }
  let(:first_comment) { user.comments.ordered.reload.first }

  header 'Accept', 'application/json'
  subject(:response) { json_response_body }

  get '/v1/user/comments' do
    parameter :page, 'Page'
    parameter :per_page, 'Items per page'

    let(:params) { { page: 1, per_page: 25 } }

    context 'with valid token' do
      before do
        header 'X-User-Email', user.email
        header 'X-User-Token', user.authentication_token
      end

      example_request 'List of comments' do
        expect(response['comments'].first).to be_a_comment_representation(first_comment)
        expect(response['meta']).to be_a_meta_representation_of(comments, params)
      end
    end

    context 'without token' do
      example_request 'List of comments authorization error' do
        expect(response_status).to eq 401
      end
    end
  end

  post '/v1/user/comments' do
    let(:params) { { title: 'Title', text: 'Text' } }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    context 'with valid token' do
      before do
        header 'X-User-Email', user.email
        header 'X-User-Token', user.authentication_token
      end

      example_request 'Create comment' do
        expect(response['comment']).to be_a_comment_representation(first_comment)
      end
    end

    context 'without token' do
      example_request 'Create comment authorization error' do
        expect(response_status).to eq 401
      end
    end
  end

  patch '/v1/user/comments/:comment_id' do
    let(:params) { { title: 'Title', text: 'Text' } }
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    before do
      header 'X-User-Email', user.email
      header 'X-User-Token', user.authentication_token
    end

    example_request 'Update comment' do
      comment.attributes = params
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end

  delete '/v1/user/comments/:comment_id' do
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    before do
      header 'X-User-Email', user.email
      header 'X-User-Token', user.authentication_token
    end

    example_request 'Delete a comment' do
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end
end
