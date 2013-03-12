require 'spec_helper'

describe '/posts' do
  describe 'list posts' do
    let!(:post) { FactoryGirl.create :post }

    before do
      get '/posts.json'
    end

    describe 'collection' do
      subject { json_response_body }

      it { should be_a_kind_of Array }
      its(:first) { should be_a_post_representation(post) }
    end
  end
end
