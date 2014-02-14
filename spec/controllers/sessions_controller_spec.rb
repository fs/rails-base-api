require 'spec_helper'

describe SessionsController do
  before do
    prepare_devise_mapping
  end

  describe 'POST #create' do
    before do
      AuthenticateUser
        .should_receive(:perform) { double(user: FactoryGirl.build(:user)) }

      post :create, format: :json
    end

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end
  end
end
