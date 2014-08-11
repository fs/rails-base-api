require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let(:post) { posts.first }
  let!(:comments) { create_list :comment, 2, post: post }
  let!(:id) { post.id }

  subject(:json_response) { json_response_body }

  get '/v1/posts' do
    example_request 'Listing posts' do
      expect(json_response['posts'].first).to be_a_post_representation(post)
    end
  end

  get '/v1/posts/:id' do
    example_request 'Single post' do
      expect(json_response['post']).to be_a_post_representation(post)
    end
  end
end
