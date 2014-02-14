require 'spec_helper'

describe '/users/sign_in' do
  describe 'sign in' do
    context 'with valid credentials' do
      let(:user) { create :user, password: '123456' }

      before do
        post '/users/sign_in.json',
          email: user.email,
          password: '123456'
      end

      subject { json_response_body }
      it { should be_a_user_representation(user) }
    end

    context 'with invalid credentials' do
      before do
        post '/users/sign_in.json'
      end

      it 'responds unauthorized with an HTTP 401 status code' do
        expect(response.code).to eq('401')
      end
    end
  end
end
