require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let!(:user) { create :user }
  let!(:post) { create :post }
  let!(:comments) { create_list :comment, 2, user: user, post: post }
  let(:first_comment) { user.comments.ordered.reload.first }
  let(:post_id) { post.id }

  header 'Accept', 'application/json'
  subject(:response) { json_response_body }

  before do
    header 'X-User-Token', user.authentication_token
    header 'X-User-Email', user.email
  end

  get '/v1/posts/:post_id/comments' do
    parameter :page, 'Page'
    parameter :per_page, 'Items per page'

    let(:params) { { page: 1, per_page: 25 } }

    context 'with valid token' do
      example_request 'List of comments' do
        expect(response['comments'].first).to be_a_comment_representation(first_comment)
        expect(response['meta']).to be_a_meta_representation_of(comments, params)
      end
    end
  end

  post '/v1/posts/:post_id/comments' do
    let(:params) { { title: 'Title', text: 'Text' } }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    context 'with valid token' do
      example_request 'Create comment' do
        expect(response['comment']).to be_a_comment_representation(first_comment)
      end
    end
  end

  patch '/v1/posts/:post_id/comments/:comment_id' do
    let(:params) { { title: 'Title', text: 'Text' } }
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    example_request 'Update comment' do
      comment.attributes = params
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end

  delete '/v1/posts/:post_id/comments/:comment_id' do
    let(:comment) { create(:comment, user: user) }
    let(:comment_id) { comment.id }

    example_request 'Delete a comment' do
      expect(response['comment']).to be_a_comment_representation(comment)
    end
  end
end
