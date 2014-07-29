require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let(:post) { posts.first }
  let!(:comments) { create_list :comment, 2, post: post }
  let!(:id) { post.id }
  subject { json_response_body }

  get '/posts.json' do
    example_request 'Listing posts' do
      expect(subject['posts'].first).to be_a_post_representation(post)
    end
  end

  get '/posts/:id.json' do
    example_request 'Single post' do
      expect(subject['post']).to be_a_post_representation(post)
    end
  end
end
