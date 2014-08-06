require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let(:post) { posts.first }
  let!(:comment) { create :comment, post: post }
  let!(:id) { post.id }

  subject { json_response_body }

  get '/v1/posts.json' do
    example_request 'Listing posts' do
      expect(subject['posts'].first).to be_a_post_representation(post)
    end
  end

  get '/v1/posts.json?page=1' do
    example_request 'Listing posts with page' do
      expect(response_status).to eq(200)
      expect(subject).to be_a_json_with_pagination_represenation_of(
        posts: posts,
        serializer_includes: {
          post: [:comments],
          comment: [:user]
        }
      )
    end
  end

  get '/v1/posts/:id.json' do
    example_request 'Single post' do
      expect(subject['post']).to be_a_post_representation(post)
    end
  end
end
