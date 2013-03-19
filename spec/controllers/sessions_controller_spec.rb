require 'spec_helper'

describe SessionsController do
  before do
    set_devise_mapping(:user)
  end

  describe 'POST #create' do
    before do
      AuthenticationService.
        any_instance.
        should_receive(:authenticate!) { FactoryGirl.build :user }

      post :create,
        format: :json
    end

    it 'responds successfully with an HTTP 201 status code' do
      expect(response).to be_success
      expect(response.code).to eq('201')
    end
  end
end
