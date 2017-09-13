require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let!(:user) { create :user }
  let(:first_post) { posts.first }

  header 'Accept', 'application/json'

  subject(:response) { json_response_body }

  before do
    header 'X-User-Email', user.email
    header 'X-User-Token', user.authentication_token
  end

  get '/v1/posts' do
    parameter :page, 'Page'
    parameter :per_page, 'Items per page'

    let(:params) { { page: 1, per_page: 25 } }

    example_request 'Listing posts' do
      expect(response['posts'].first).to be_a_post_representation(first_post)
      expect(response['meta']).to be_a_meta_representation_of(posts, params)
    end
  end

  get '/v1/posts/:id' do
    let(:id) { first_post.id }

    example_request 'Single post' do
      expect(response['post']).to be_a_post_representation(first_post)
    end
  end

  post '/v1/posts' do
    let(:params) do
      {
        post: {
          title: 'Title', text: 'Text'
        }
      }
    end

    parameter :title, 'Title', required: true
    parameter :text, 'Text', required: true

    example_request 'Create post' do
      expect(response['post']).to be_a_post_representation(Post.last)
    end
  end
end
