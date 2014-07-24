require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  let(:json_response) { json_response_body }

  post '/users/sign_in' do
    let(:user) { create :user, password: '123456' }

    parameter :email, 'Email', required: true
    parameter :password, 'Password', required: true

    let(:email) { user.email }

    example_request 'Sign in with valid password', password: '123456' do
      expect(json_response['user']).to be_a_user_representation(user)
    end

    example_request 'Sign in with invalid password', password: '' do
      expect(response_status).to eq 401
    end
  end
end
