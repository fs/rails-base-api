require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let!(:user) { create :user }
  subject(:json_response) { json_response_body }

  get '/v1/user/comments' do
    let!(:comment) { create :comment, user: user }

    it_behaves_like 'a request that requires an authentication'

    context 'with valid token' do
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'List of comments' do
        expect(json_response['comments'].first).to be_a_comment_representation(comment)
      end
    end
  end

  post '/v1/user/comments' do
    let(:params) { { title: 'Title', text: 'Text' } }
    let(:comment) { user.comments.first }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    it_behaves_like 'a request that requires an authentication'

    context 'with valid token' do
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'Create comment' do
        expect(json_response['comment']).to be_a_comment_representation(comment)
      end
    end
  end
end
