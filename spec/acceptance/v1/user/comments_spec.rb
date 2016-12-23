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
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'List of comments' do
        expect(response['comments'].first).to be_a_comment_representation(first_comment)
        expect(response['meta']).to be_a_meta_representation_of(comments, params)
      end
    end

    include_context 'a request without token'
  end

  post '/v1/user/comments' do
    let(:params) { { title: 'Title', text: 'Text' } }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    context 'with valid token' do
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'Create comment' do
        expect(response['comment']).to be_a_comment_representation(first_comment)
      end
    end

    include_context 'a request without token'
  end

  patch '/v1/user/comments/:comment_id' do
    let(:params) { { title: 'Title', text: 'Text' } }
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    before { header 'X-AUTH-TOKEN', user.authentication_token }

    example_request 'Update comment' do
      comment.attributes = params
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end

  delete '/v1/user/comments/:comment_id' do
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    before { header 'X-AUTH-TOKEN', user.authentication_token }

    example_request 'Delete a comment' do
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end
end
