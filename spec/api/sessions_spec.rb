require 'spec_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  post '/users/sign_in.json' do
    let!(:user) { create :user }
    subject { json_response_body }

    parameter :email, 'Email', required: true
    parameter :password, 'Password', required: true

    context 'with valid credentials' do
      let(:params) { { email: user.email, password: '123456' } }

      example_request 'Sign in' do
        expect(subject).to be_a_user_representation(user)
      end
    end

    context 'with invalid credentials' do
      example_request 'Sign in\'s errors' do
        expect(response_status).to eq 401
      end
    end
  end
end
