require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let(:post) { posts.first }
  let!(:comment) { create :comment, post: post }
  let!(:id) { post.id }

  subject(:response) { json_response_body }

  get '/v1/posts' do
    parameter :page, 'Page'
    parameter :per_page, 'Items per page'

    let(:params) { { page: 1, per_page: 25 } }

    example_request 'Listing posts' do
      expect(response['posts'].first).to be_a_post_representation(post)
      expect(response['meta']).to be_a_meta_representation_of(posts, params)
    end
  end

  get '/v1/posts/:id' do
    example_request 'Single post' do
      expect(response['post']).to be_a_post_representation(post)
    end
  end
end
