require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let!(:user) { create :user }
  let!(:comments) { create_list :comment, 2, user: user }
  let(:first_comment) { user.comments.reload.first }

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
      before { header 'X-AUTH-TOKEN', user.authentication_token }

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
end
