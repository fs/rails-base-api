require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Posts' do
  let!(:posts) { create_list :post, 2 }
  let(:post) { posts.first }
  let!(:comments) { create_list :comment, 2, post: post }
  let!(:id) { post.id }
  subject { json_response_body }

  get '/posts.json' do
    let(:default_meta) do
      {
        total: 2,
        per_page:  25,
        page: 1
      }
    end

    example_request 'Listing posts with default meta' do
      expect(subject['posts'].first).to be_a_post_representation(post)
      expect(subject['meta']).to be_a_meta_data(default_meta)
    end

    context 'with pagination params' do
      parameter :page, 'Pagination page parameter'
      parameter :per_page, 'Pagination per_page parameter'

      let(:page) { 1 }
      let(:per_page) { 1 }

      let(:meta) do
        {
          total: 2,
          per_page:  1,
          page: 1
        }
      end

      example_request 'List of posts with meta' do
        expect(subject['meta']).to be_a_meta_data(meta)
      end
    end
  end

  get '/posts/:id.json' do
    example_request 'Single post' do
      expect(subject['post']).to be_a_post_representation(post)
    end
  end
end
