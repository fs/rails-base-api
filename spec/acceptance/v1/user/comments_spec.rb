require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Comments' do
  let!(:user) { create :user }
  subject { json_response_body }

  get '/v1/user/comments.json' do
    let!(:comment) { create :comment, user: user }
    let(:default_meta) do
      {
        pagination: {
          page: 1,
          per_page:  25,
          total: 1
        }
      }
    end

    context 'with valid token' do
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'List of comments with default meta' do
        expect(subject['comments'].first).to be_a_comment_representation(comment)
        expect(subject['meta']).to be_a_meta_data(default_meta)
      end

      context 'with pagination params' do
        parameter :page, 'Pagination page parameter'
        parameter :per_page, 'Pagination per_page parameter'

        let(:page) { 1 }
        let(:per_page) { 1 }

        let(:meta) do
          {
            pagination: {
              page: 1,
              per_page:  1,
              total: 1
            }
          }
        end

        example_request 'List of comments with meta' do
          expect(subject['meta']).to be_a_meta_data(meta)
        end
      end
    end

    context 'without token' do
      example_request 'List of comments authorization error' do
        expect(response_status).to eq 401
      end
    end
  end

  post '/v1/user/comments.json' do
    let(:params) { { title: 'Title', text: 'Text' } }
    let(:comment) { user.comments.first }

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    context 'with valid token' do
      before { header 'X-AUTH-TOKEN', user.authentication_token }

      example_request 'Create comment' do
        expect(subject['comment']).to be_a_comment_representation(comment)
      end
    end

    context 'without token' do
      example_request 'Create comment authorization error' do
        expect(response_status).to eq 401
      end
    end
  end
end
